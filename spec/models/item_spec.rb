require "rails_helper"

RSpec.describe Item, type: :model do
  before (:each) do
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")
      @merchant2 = Merchant.create!(name: "Arnold's Armoire")
      @item1 = Item.create!(
        name: "Item Qui Esse",
        description:
        "Nihil autem sit odio inventore deleniti.",
        unit_price: 75107,
        merchant_id: @merchant1.id
      )
      @item2 = Item.create!( 
        name: "Item Autem Minima",
        description:
        "Cumque consequuntur ad.",
        unit_price: 67076,
        merchant_id: @merchant1.id
      )
      @item3 = Item.create!(
        name: "Item Ea Voluptatum",
        description:
        "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.",
        unit_price: 32301,
        merchant_id: @merchant1.id
      )
      @item4 = Item.create!(
        name: "Item Nemo Facere",
        description: "Sunt eum id eius magni consequuntur delectus veritatis.",
        unit_price: 4291,
        merchant_id: @merchant2.id
      )     
      @item5 = Item.create!(name: "Gold Ring", unit_price: 1200, merchant_id: @merchant1.id, description: "14k Gold")
      @item6 = Item.create!(name: "Silver Ring", unit_price: 900, merchant_id: @merchant1.id, description: "Pure Silver")
      @item7 = Item.create!(name: "Gold Necklace", unit_price: 1400, merchant_id: @merchant1.id, description: "10k Gold")
      @item8 = Item.create!(name: "Silver Necklace", unit_price: 1000, merchant_id: @merchant1.id, description: "Pure Silver")
      @item9 = Item.create!(name: "Hair Clip", unit_price: 25, merchant_id: @merchant1.id, description: "Black Plastic")
      @item10 = Item.create!(name: "Hoop Earrings", unit_price: 125, merchant_id: @merchant1.id, description: "Bonze")

      @customer1 = Customer.create!(first_name: "John", last_name: "Jacobs")
      @customer2 = Customer.create!(first_name: "Susan", last_name: "Robinson")
      @customer3 = Customer.create!(first_name: "Jessica", last_name: "Simpson")
      @customer4 = Customer.create!(first_name: "Harry", last_name: "Potter")
      @customer5 = Customer.create!(first_name: "Ron", last_name: "Weasley")
      @customer6 = Customer.create!(first_name: "Nicole", last_name: "Johnson")

      @invoice1 = Invoice.create!(status: 2, customer_id: @customer1.id)
      @invoice2 = Invoice.create!(status: 2, customer_id: @customer2.id)
      @invoice3 = Invoice.create!(status: 2, customer_id: @customer3.id)
      @invoice4 = Invoice.create!(status: 2, customer_id: @customer4.id)
      @invoice5 = Invoice.create!(status: 2, customer_id: @customer5.id)
      @invoice6 = Invoice.create!(status: 2, customer_id: @customer6.id)
      @invoice7 = Invoice.create!(status: 2, customer_id: @customer6.id)
      @invoice8 = Invoice.create!(status: 2, customer_id: @customer6.id)
      @invoice9 = Invoice.create!(status: 2, customer_id: @customer6.id)
      @invoice10 = Invoice.create!(status: 2, customer_id: @customer6.id)
      @invoice11 = Invoice.create!(status: 2, customer_id: @customer6.id)
      @invoice12 = Invoice.create!(status: 2, customer_id: @customer6.id)

      @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 111, status: 1) 
      @invoice_item2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 1, unit_price: 345, status: 1) 
      @invoice_item3 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice3.id, quantity: 1, unit_price: 420, status: 1) 
      @invoice_item4 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice4.id, quantity: 1, unit_price: 345, status: 1) 
      @invoice_item5 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice5.id, quantity: 1, unit_price: 420, status: 1) 
      @invoice_item6 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice6.id, quantity: 1, unit_price: 345, status: 1) 
      @invoice_item7 = InvoiceItem.create!(item_id: @item8.id, invoice_id: @invoice7.id, quantity: 1, unit_price: 711, status: 1)
      @invoice_item8 = InvoiceItem.create!(item_id: @item9.id, invoice_id: @invoice8.id, quantity: 1, unit_price: 711, status: 1)
      @invoice_item9 = InvoiceItem.create!(item_id: @item10.id, invoice_id: @invoice9.id, quantity: 1, unit_price: 345, status: 1)
      @invoice_item10 = InvoiceItem.create!(item_id: @item8.id, invoice_id: @invoice10.id, quantity: 1, unit_price: 126, status: 1)
      @invoice_item11 = InvoiceItem.create!(item_id: @item9.id, invoice_id: @invoice11.id, quantity: 1, unit_price: 123, status: 1)
      @invoice_item12 = InvoiceItem.create!(item_id: @item10.id, invoice_id: @invoice12.id, quantity: 1, unit_price: 345, status: 1)

      @transaction1 = Transaction.create!(invoice_id: @invoice1.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction2 = Transaction.create!(invoice_id: @invoice2.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction3 = Transaction.create!(invoice_id: @invoice3.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction4 = Transaction.create!(invoice_id: @invoice4.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction5 = Transaction.create!(invoice_id: @invoice5.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction6 = Transaction.create!(invoice_id: @invoice6.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction7 = Transaction.create!(invoice_id: @invoice7.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction8 = Transaction.create!(invoice_id: @invoice8.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction9 = Transaction.create!(invoice_id: @invoice9.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction10 = Transaction.create!(invoice_id: @invoice10.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction11 = Transaction.create!(invoice_id: @invoice11.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
      @transaction12 = Transaction.create!(invoice_id: @invoice12.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  end

  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
  end

  describe 'packaged' do
    it 'should return the invoice id' do
      
      expect(@item1.packaged).to eq(@item1)   
    end
  end

  #this originally had a typo
  describe 'invoice_id' do
    it 'plucks the invoice id' do          
      expect(@item1.invoice_id).to eq([@invoice1.id, @invoice3.id, @invoice5.id])
    end
  end

    describe 'invoice_date' do
      it 'plucks the invoice date' do
      expect(@item1.invoice_date).to eq(@invoice1.creation_date)
    end
  end

  describe 'button_text' do 
    it "provides the enable/disable button text" do
      expect(@item1.button_text).to eq("Enable")
    end
  end

  describe "toggle_status" do
    it "flips the status" do 
      expect(@item1.status).to eq("disabled")
      @item1.toggle_status
      expect(@item1.status).to eq("enabled")
      @item1.toggle_status
      expect(@item1.status).to eq("disabled")
    end
  end

  describe "item_revenue" do
    it "returns the total revenue of an item" do    
      @revenue = Item.item_revenue(@item1)

      expect(@revenue).to eq(@invoice_item1.unit_price + @invoice_item3.unit_price + @invoice_item5.unit_price)
    end
  end

  describe "item_best_day" do
    it "returns the date with the most sales for each item" do
      best_day = Item.item_best_day(@item1)
      date_stub = Date.new(best_day.year, best_day.month, best_day.day)
      allow(Date).to receive(:today).and_return(date_stub)
      expect(best_day).to eq(Date.today)
    end
  end

  describe "#enabled?" do
    context "when item status is 'enabled'" do
      it "returns true" do
        item = Item.new(status: "enabled")
        expect(item.enabled?).to eq(true)
      end
    end

    context "when item status is not 'enabled'" do
      it "returns nil" do
        item = Item.new(status: "disabled")
        expect(item.enabled?).to eq(nil)
      end
    end
  end

  describe "#alphabetical" do
    it "returns items in order by name" do
      expect(Item.alphabetical).to eq([@item7, @item5, @item9, @item10, @item2, @item3, @item4, @item1, @item8, @item6])
    end
  end

  describe "#most_recent" do
    it "returns in order of most recently created" do
      merchant1 = Merchant.create!(name: "Hannah's Handbags")
      item5 = Item.create!(name: "Gold Ring", unit_price: 1200, merchant_id: merchant1.id, description: "14k Gold", created_at: "2012-03-11 15:54:10 UTC")
      item6 = Item.create!(name: "Silver Ring", unit_price: 900, merchant_id: merchant1.id, description: "Pure Silver", created_at: "2012-03-13 15:54:10 UTC")
      item7 = Item.create!(name: "Gold Necklace", unit_price: 1400, merchant_id: merchant1.id, description: "10k Gold", created_at: "2012-03-12 15:54:10 UTC")
      
      expect(merchant1.items.most_recent).to eq([item6, item7, item5])
    end
  end

  #Where did this go?
  describe "#old_to_new" do
    it 'sorts them from oldest to newest' do
      expect(Item.old_to_new.to_a).to eq([@item1, @item2, @item1, @item2, @item1, @item2, @item8, @item9, @item10, @item8, @item9, @item10])
    end
  end
end