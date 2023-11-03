require "rails_helper"

RSpec.describe Item, type: :model do
  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }

  end

  describe 'packaged' do
    it 'should return the invoice id' do
      merchant1 = Merchant.create!(name: "Hannah's Handbags")
      item1 = Item.create!(
        id: 1,
        name: "Item Qui Esse",
        description:
        "Nihil autem sit odio inventore deleniti.",
        unit_price: 75107,
        merchant_id: merchant1.id
      )
      customer1 = Customer.create!(id: 1, first_name: "Alan", last_name: "Smith")
      invoice1 = Invoice.create!(id: 1, status: 1, customer_id: customer1.id)
      invoice_item = InvoiceItem.create!(quantity: 5, unit_price: 10, status: 1, item_id: item1.id, invoice_id: invoice1.id)

      expect(item1.packaged).to eq(item1)
    
    end
  end

  describe 'invoice_ids' do
    it 'plucks the invoice id' do
      merchant1 = Merchant.create!(name: "Hannah's Handbags")
      item1 = Item.create!(
        id: 1,
        name: "Item Qui Esse",
        description:
        "Nihil autem sit odio inventore deleniti.",
        unit_price: 75107,
        merchant_id: merchant1.id
      )
      customer1 = Customer.create!(id: 1, first_name: "Alan", last_name: "Smith")
      invoice1 = Invoice.create!(id: 1, status: 1, customer_id: customer1.id)
      invoice_item = InvoiceItem.create!(quantity: 5, unit_price: 10, status: 1, item_id: item1.id, invoice_id: invoice1.id)
      
      expect(item1.invoice_ids).to eq([invoice1.id])
    end
  end
end