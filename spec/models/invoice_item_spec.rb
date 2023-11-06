require "rails_helper"

RSpec.describe InvoiceItem, type: :model do
  describe "relationships" do
    it { should belong_to(:item) }
    it { should belong_to(:invoice) }
  end
  before (:each) do 
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")
    @customer1 = Customer.create!(first_name: "Joey", last_name: "Ondricka")
    @item1 = Item.create!(name: "Item Qui Esse", description: "Nihil autem sit odio inventore deleniti.", unit_price: 75107, merchant_id: @merchant1.id)
    @invoice1 = Invoice.create!(status: "completed", customer_id: @customer1.id, created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 111, status: 1) 
    
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
end