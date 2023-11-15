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

end 