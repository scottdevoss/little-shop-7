require 'rails_helper'

RSpec.describe 'admin invoices show page' do
  describe 'as an admin' do
    describe 'when I visit admin invoices show page (/admin/invoices/:id)' do
      before :each do

        @merchant1 = Merchant.create!(name: "Hannah's Handbags")
        @merchant2 = Merchant.create!(name: "Arnold's Armoire")

        @item1 = Item.create!(name: "Item Qui Esse", description: "Nihil autem sit odio inventore deleniti.", unit_price: 75107, merchant_id: @merchant1.id)
        @item2 = Item.create!(name: "Item Autem Minima", description: "Cumque consequuntur ad.", unit_price: 67076, merchant_id: @merchant1.id)
        @item3 = Item.create!(name: "Item Ea Voluptatum", description: "Sunt officia eum qui molestiae.", unit_price: 32301, merchant_id: @merchant1.id)
        @item4 = Item.create!(name: "Item Nemo Facere", description: "Sunt eum id eius magni consequuntur delectus veritatis.", unit_price: 4291, merchant_id: @merchant2.id)
        @item5 = Item.create!(name: "Gold Ring", unit_price: 1200, merchant_id: @merchant1.id, description: "14k Gold")
        @item6 = Item.create!(name: "Silver Ring", unit_price: 900, merchant_id: @merchant1.id, description: "Pure Silver")
        @item7 = Item.create!(name: "Gold Necklace", unit_price: 1400, merchant_id: @merchant1.id, description: "10k Gold")
        @item8 = Item.create!(name: "Silver Necklace", unit_price: 1000, merchant_id: @merchant1.id, description: "Pure Silver")
        @item9 = Item.create!(name: "Hair Clip", unit_price: 25, merchant_id: @merchant1.id, description: "Black Plastic")
        @item10 = Item.create!(name: "Hoop Earrings", unit_price: 125, merchant_id: @merchant2.id, description: "Bonze")
        
        @customer1 = Customer.create!(first_name: "Joey", last_name: "Ondricka")
        @customer2 = Customer.create!(first_name: "Cecelia", last_name: "Osinski")
        @customer3 = Customer.create!(first_name: "Mariah", last_name: "Toy")
        @customer4 = Customer.create!(first_name: "Leanne", last_name: "Braun")
        @customer5 = Customer.create!(first_name: "Sylvester", last_name: "Nader")
        @customer6 = Customer.create!(first_name: "Heber", last_name: "Kuhn")
        @customer7 = Customer.create!(first_name: "Parker", last_name: "Daugherty")

        @invoice1 = Invoice.create!(status: "completed", customer_id: @customer1.id, created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC")
        @invoice2 = Invoice.create!(status: "completed", customer_id: @customer2.id, created_at: "2012-03-12 05:54:09 UTC", updated_at: "2012-03-12 05:54:09 UTC")
        @invoice3 = Invoice.create!(status: "completed", customer_id: @customer3.id, created_at: "2012-03-10 00:54:09 UTC", updated_at: "2012-03-10 00:54:09 UTC")
        @invoice4 = Invoice.create!(status: "completed", customer_id: @customer4.id, created_at: "2012-03-24 15:54:10 UTC", updated_at: "2012-03-24 15:54:10 UTC")
        @invoice5 = Invoice.create!(status: "completed", customer_id: @customer5.id, created_at: "2012-03-07 19:54:10 UTC", updated_at: "2012-03-07 19:54:10 UTC")
        @invoice6 = Invoice.create!(status: "completed", customer_id: @customer6.id, created_at: "2012-03-09 01:54:10 UTC", updated_at: "2012-03-09 01:54:10 UTC")
        @invoice7 = Invoice.create!(status: "completed", customer_id: @customer7.id, created_at: "2012-03-07 21:54:10 UTC", updated_at: "2012-03-07 21:54:10 UTC")
        @invoice8 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-13 16:54:10 UTC", updated_at: "2012-03-13 16:54:10 UTC")
        @invoice9 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
        @invoice10 = Invoice.create!(status: "cancelled", customer_id: @customer7.id, created_at: "2012-03-06 21:54:10 UTC", updated_at: "2012-03-06 21:54:10 UTC")
        @invoice11 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-08 20:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

        @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 75107, status: 1) 
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
        @invoice_item12 = InvoiceItem.create!(item_id: @item9.id, invoice_id: @invoice1.id, quantity: 2, unit_price: 25, status: 1)

        @tranaction1 = Transaction.create!(invoice_id: @invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction2 = Transaction.create!(invoice_id: @invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction13 = Transaction.create!(invoice_id: @invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "failed")
        @tranaction14 = Transaction.create!(invoice_id: @invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction3 = Transaction.create!(invoice_id: @invoice2.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "failed")
        @tranaction4 = Transaction.create!(invoice_id: @invoice2.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "failed")
        @tranaction5 = Transaction.create!(invoice_id: @invoice3.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction6 = Transaction.create!(invoice_id: @invoice3.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction7 = Transaction.create!(invoice_id: @invoice4.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction8 = Transaction.create!(invoice_id: @invoice4.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction9 = Transaction.create!(invoice_id: @invoice5.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction10 = Transaction.create!(invoice_id: @invoice5.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction11 = Transaction.create!(invoice_id: @invoice6.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
        @tranaction12 = Transaction.create!(invoice_id: @invoice7.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "04/27", result: "success")
      end

      # US 33, Admin Invoice Show Page
      it 'gives information related to invoice' do
        visit "/admin/invoices/#{@invoice9.id}"
        expect(page).to have_content(@invoice9.status)
        expect(page).to have_content(@invoice9.id)
        expect(page).to have_content("Created Wednesday, March 7, 2012")
        expect(page).to have_content(@customer7.full_name)
        
      end

      #US 34 - Invoice Item Information
      it "Gives all the items information on the invoice (Name, quantity, price, status)" do
        visit "/admin/invoices/#{@invoice1.id}"
        
        @invoice1.invoice_items.each do |invoice_item|
        
          expect(page).to have_content(invoice_item.item.name)
          expect(page).to have_content(invoice_item.quantity)
          expect(page).to have_content(invoice_item.unit_price)
          expect(page).to have_content(invoice_item.status)
          expect(page).to_not have_content(@item3.name)
          expect(page).to_not have_content(@item3.unit_price)
          expect(page).to_not have_content(@item4.name)
        end
      end
    end
  end
end