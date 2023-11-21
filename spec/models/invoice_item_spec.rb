require "rails_helper"

RSpec.describe InvoiceItem, type: :model do
  describe "relationships" do
    it { should belong_to(:item) }
    it { should belong_to(:invoice) }
  end
  before (:each) do 
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")
    @customer1 = Customer.create!(first_name: "Joey", last_name: "Ondricka")
    @item1 = Item.create!(name: "Diamond Earrings", description: "Better than Jared.", unit_price: 100, merchant_id: @merchant1.id)
    @item2 = Item.create!(name: "Brolex Watch", description: "The Rolex for 'Bros'.", unit_price: 200, merchant_id: @merchant1.id)
    @item3 = Item.create!(name: "Sterling Silver Necklace", description: "100% sterling silver.", unit_price: 500, merchant_id: @merchant1.id)
    @item4 = Item.create!(name: "Gold bracelet", description: "24-karat awesome.", unit_price: 1000, merchant_id: @merchant1.id)
    @invoice1 = Invoice.create!(status: "completed", customer_id: @customer1.id, created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC")
    @invoice2 = Invoice.create!(status: "completed", customer_id: @customer1.id, created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC")
    @invoice3 = Invoice.create!(status: "completed", customer_id: @customer1.id, created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 9, unit_price: 100, status: 1, created_at: "2012-03-25 09:54:09 UTC") 
    @invoice_item2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 10, unit_price: 200, status: 1, created_at: "2012-03-24 09:21:09 UTC") 
    @invoice_item3 = InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice2.id, quantity: 14, unit_price: 500, status: 1, created_at: "2012-03-26 19:54:12 UTC") 
    @invoice_item4 = InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice1.id, quantity: 15, unit_price: 1000, status: 1, created_at: "2012-03-26 02:32:09 UTC") 
    @invoice_item5 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice3.id, quantity: 19, unit_price: 100, status: 1, created_at: "2012-03-20 09:02:09 UTC") 
    @invoice_item6 = InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice3.id, quantity: 20, unit_price: 500, status: 1, created_at: "2012-03-18 01:43:09 UTC") 
    @discount1 = Discount.create!({discount: 20, qty: 10, merchant_id: @merchant1.id})
    @discount2 = Discount.create!({discount: 25, qty: 15, merchant_id: @merchant1.id})
    @discount3 = Discount.create!({discount: 30, qty: 20, merchant_id: @merchant1.id})
  end

  describe "#merchant" do
    it "finds the merchant id from an invoice item" do
      expect(@invoice_item1.merchant).to eq(@merchant1.id)
    end
  end

  describe "#change_status" do
    it "toggles the status" do
      expect(@invoice_item1.status).to eq("packaged")
      @invoice_item1.change_status("pending")
      expect(@invoice_item1.status).to eq("pending")
      @invoice_item1.change_status("packaged")
      expect(@invoice_item1.status).to eq("packaged")
    end
  end

  describe "#most_recent" do
    it "lists invoice_items in order of most recently created" do
      expect(InvoiceItem.most_recent).to eq([@invoice_item3, @invoice_item4, @invoice_item1, @invoice_item2, @invoice_item5, @invoice_item6])
    end
  end

  describe "#discount_rate" do 
    it "returns the highest discount rate for which an item qualifies based on the quantity purchased" do 
      expect(@invoice_item1.discount_rate).to eq(0)
      expect(@invoice_item2.discount_rate).to eq(0.2)
      expect(@invoice_item3.discount_rate).to eq(0.2)
      expect(@invoice_item4.discount_rate).to eq(0.25)
      expect(@invoice_item5.discount_rate).to eq(0.25)
      expect(@invoice_item6.discount_rate).to eq(0.3)
    end
  end

end