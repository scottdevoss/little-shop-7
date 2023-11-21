require "rails_helper" 

RSpec.describe Discount do 
  before(:each) do 
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")

    @customer1 = Customer.create!(first_name: "John", last_name: "Jacobs")

    @item1 = Item.create!(name: "Gold Ring", unit_price: 100, merchant_id: @merchant1.id, description: "14k Gold")
    @item2 = Item.create!(name: "Silver Ring", unit_price: 200, merchant_id: @merchant1.id, description: "Pure Silver")
    @item3 = Item.create!(name: "Platinum Bracelet", unit_price: 500, merchant_id: @merchant1.id, description: "Platinum")
    @item3 = Item.create!(name: "Brolex Watch", unit_price: 1000, merchant_id: @merchant1.id, description: "The Rolex for Bros")

    @invoice1 = Invoice.create!(status: 2, customer_id: @customer1.id)
    @invoice2 = Invoice.create!(status: 2, customer_id: @customer1.id)
    @invoice3 = Invoice.create!(status: 2, customer_id: @customer1.id)

    @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 9, unit_price: 100, status: 2) 
    @invoice_item2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 14, unit_price: 200, status: 2) 
    @invoice_item3 = InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice3.id, quantity: 19, unit_price: 500, status: 2) 
    @invoice_item4 = InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice4.id, quantity: 20, unit_price: 1000, status: 2) 

    @transaction1 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice1.id)
    @transaction2 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice2.id)

    @discount1 = Discount.create!(discount: 20, qty: 10, merchant_id: @merchant1.id )
    @discount2 = Discount.create!(discount: 30, qty: 15, merchant_id: @merchant1.id )
    @discount3 = Discount.create!(discount: 35, qty: 20, merchant_id: @merchant1.id )
  end

  it "is created as an instance of Discount with percentage discount, quantity threshold, and merchant_id attributes" do
    expect(@discount1.class).to be(Discount)
    expect(@discount1.discount).to eq(20)
    expect(@discount1.qty).to eq(10)
    expect(@discount1.merchant_id).to eq(@merchant1.id)
  end

end 