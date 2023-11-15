require "rails_helper" 

RSpec.describe "Bulk Discounts Index Page" do 
  before(:each) do 
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")
    @customer1 = Customer.create!(first_name: "John", last_name: "Jacobs")
    @item1 = Item.create!(name: "Gold Ring", unit_price: 100, merchant_id: @merchant1.id, description: "14k Gold")
    @item2 = Item.create!(name: "Silver Ring", unit_price: 50, merchant_id: @merchant1.id, description: "Pure Silver")
    @invoice1 = Invoice.create!(status: 2, customer_id: @customer1.id)
    @invoice2 = Invoice.create!(status: 2, customer_id: @customer1.id)
    @invoice3 = Invoice.create!(status: 2, customer_id: @customer1.id)
    @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 100, status: 2) 
    @invoice_item2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 50, status: 2) 
    @transaction1 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice1.id)
    @transaction2 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice2.id)
    @discount1 = Discount.create!(discount: 20, qty: 10, merchant_id: @merchant1.id)
    @discount2 = Discount.create!(discount: 30, qty: 15, merchant_id: @merchant1.id)
    @discount3 = Discount.create!(discount: 35, qty: 20, merchant_id: @merchant1.id)
  end

  it "as a Merchant, when I visit my merchant dashboard, then I see a link to view all my discounts " do 

    visit "merchants/#{@merchant1.id}/dashboard"

    expect(page).to have_link "View my discounts"
  end

  it "when I click this link, I am taken to my bulk discounts index page where I see the percentage discount and quantity thresholds for all my bulk discounts" do 
    visit "merchants/#{@merchant1.id}/dashboard"
    click_link "View my discounts" 
    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")

    discounts = Discount.all

    discounts.each do |discount|
      visit "/merchants/#{discount.merchant_id}/discounts"
      within "#idx-#{discount.id}" do 
        expect(page).to have_link("#{discount.discount}% off #{discount.qty} items")
        click_link "#{discount.discount}% off #{discount.qty} items"
        expect(current_path).to eq("/merchants/#{discount.merchant_id}/discounts/#{discount.id}")
        # expect(page).to have_content("#{discount.merchant.name}'s #{discount.discount.to_i}% off Discount")
      end
    end
  end

  describe "Merchant Bulk Discount Create" do 
    it "has a form with rate and threshold fields that a user can fill in with valid data to create a new discount" do 
      #When I visit my bulk discounts index I see a link to create a new discount
      visit "/merchants/#{@merchant1.id}/discounts"

      expect(page).to have_link("Create a new discount")
      # When I click this link 
      click_link("Create a new discount")
      # I am taken to a new page where I see a form to add a new bulk discount
      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/new")
      expect(page).to have_field(:new_rate)
      expect(page).to have_field(:threshold)
      expect(page).to have_button("Add new discount")
      #  When I fill in the form with valid data
      fill_in :new_rate, with: 50
      fill_in :threshold, with: 50  

      click_button("Add new discount")

      # Then I am redirected back to the bulk discount index
      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")
      # And I see my new bulk discount listed
      expect(page).to have_link("50% off 50 items")
    end

    it "will not save invalid data entered into the rate field and will send an error message alerting the user that their new discount was not saved to the system" do
      visit "/merchants/#{@merchant1.id}/discounts/new"
      
      fill_in :new_rate, with: "%32-"
      fill_in :threshold, with: 50
      
      click_button("Add new discount")
      
      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")
      expect(page).to have_content("Discount not added. The discount rate or quantity field was not filled in correctly. Please try again.")
      
      click_link("Create a new discount")
      
      fill_in :new_rate, with: 50
      fill_in :threshold, with: Time.now
      
      click_button("Add new discount")
      
 
      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")

      expect(page).to have_content("Discount not added. The discount rate or quantity field was not filled in correctly. Please try again.")
      
      click_link("Create a new discount")
      
      fill_in :new_rate, with: " "
      fill_in :threshold, with: " "
      
      click_button("Add new discount")

      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")

      expect(page).to have_content("Discount not added. The discount rate or quantity field was not filled in correctly. Please try again.")
    end
  end 
end 