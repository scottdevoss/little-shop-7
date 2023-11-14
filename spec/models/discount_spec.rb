require "rails_helper" 

RSpec.describe Discount do 
  before(:each) do 
    before(:each) do 
      @merchant1 = Merchant.create!(name: "Hannah's Handbags")

      @customer1 = Customer.create!(first_name: "John", last_name: "Jacobs")

      # TODO - Need item instances!!

      @invoice1 = Invoice.create!(status: 2, customer_id: @customer1.id)
      @invoice2 = Invoice.create!(status: 2, customer_id: @customer1.id)
      @invoice3 = Invoice.create!(status: 2, customer_id: @customer1.id)

      @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 100, status: 2) 
      @invoice_item2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 100, status: 2) 
      @invoice_item3 = InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice3.id, quantity: 1, unit_price: 100, status: 2) 

      @transaction1 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice1.id)
      @transaction2 = Transaction.create!(credit_card_number: 123456789, credit_card_expiration_date: "11/26", result: 0, invoice_id: @invoice2.id)

      @discount_1 = Discount.create!(percentage: 20, quantity: 10, merchant_id: @merchant1.id )
      @discount_2 = Discount.create!(percentage: 30, quantity: 15, merchant_id: @merchant1.id )
      @discount_2 = Discount.create!(percentage: 35, quantity: 20, merchant_id: @merchant1.id )
     end
   end

  it "is created as an instance of Discount with percentage discount, quantity threshold, and merchant_id attributes" do

  end
  
end 