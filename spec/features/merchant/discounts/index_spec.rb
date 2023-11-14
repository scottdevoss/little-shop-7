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
   end

  it "as a Merchant, when I visit my merchant dashboard, then I see a link to view all my discounts " do 

    visit "merchants/#{@merchant1.id}/dashboard"

    expect(page).to have_link "View My Discounts"
  end

  it "when I click this link, I am taken to my bulk discounts index page where I see the percentage discount and quantity thresholds for all my bulk discounts" do 

    visit "merchants/#{@merchant1.id}/dashboard"

    click_link "View My Discounts" 

    expect(current_path).to eq("merchants/#{merchant.id}/discounts")

    within "#discount-#{discount.id}" do 
      expect(page).to have_content("20% off of 10 items")
      expect(page).to have_content("30% off of 15 items")
      expect(page).to have_content("35% off of 20 items")
    end
  end

  it "each bulk discount listed includes a link to its show page" do 

    Discount.each.with_index do |discount, idx| 
      visit "merchants/#{merchant.id}/discounts"
      within "#discount-#{discount.id}" do 
        expect(page).to have_link(discount.name)
        click_link "#{discount.name}"
        expect(current_path).to eq("merchants/#{merchant.id}/discounts/#{discount.id}")
        expect(page).to have_content("@discount#{idx}.name")
      end
    end
  end

end 