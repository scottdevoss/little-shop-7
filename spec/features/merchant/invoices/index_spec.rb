require 'rails_helper'

RSpec.describe 'merchant invoices index' do
  before (:each) do
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

    @customer1 = Customer.create!(first_name: "John", last_name: "Jacobs")
    @customer2 = Customer.create!(first_name: "Susan", last_name: "Robinson")
    @customer3 = Customer.create!(first_name: "Jessica", last_name: "Simpson")
    @customer4 = Customer.create!(first_name: "Harry", last_name: "Potter")
    @customer5 = Customer.create!(first_name: "Ron", last_name: "Weasley")
    @customer6 = Customer.create!(first_name: "Nicole", last_name: "Johnson")

    @invoice1 = Invoice.create!(status: 2, customer_id: @customer1.id, created_at: "2012-03-24 15:54:10 UTC")
    @invoice2 = Invoice.create!(status: 2, customer_id: @customer2.id, created_at: "2012-03-10 00:54:09 UTC")
    @invoice3 = Invoice.create!(status: 2, customer_id: @customer3.id, created_at: "2012-03-25 09:54:09 UTC")
    @invoice4 = Invoice.create!(status: 2, customer_id: @customer4.id, created_at: "2012-03-12 05:54:09 UTC")
    @invoice5 = Invoice.create!(status: 2, customer_id: @customer5.id, created_at: "2012-03-07 19:54:10 UTC")
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

  describe 'when I visit merchant invoice index' do
    it 'shows all of the invoices that include at least one item' do
      visit "/merchants/#{@merchant1.id}/invoices"
      
      expect(page).to have_content(@invoice1.id)
      expect(page).to have_content(@invoice2.id)
      expect(page).to have_content(@invoice8.id)
      expect(page).to have_content(@invoice7.id)
      expect(page).to have_content(@invoice10.id)
      
      expect(page).to_not have_content(@invoice9.id)
      expect(page).to_not have_content(@invoice12.id)
    end
    it 'each invoice id is a link' do
      visit "/merchants/#{@merchant2.id}/invoices"
      expect(page).to have_link("#{@invoice_item9.invoice_id}")
      expect(page).to have_link("#{@invoice_item12.invoice_id}")
      click_link("#{@invoice_item9.invoice_id}")
      expect(current_path).to eq("/merchants/#{@merchant2.id}/invoices/#{@invoice_item9.invoice_id}")
    end

    describe "sort by functionality" do
      it 'can sort alphabetically' do
        visit "/merchants/#{@merchant1.id}/invoices"
        save_and_open_page
        expect("#{@invoice1.id}").to appear_before("#{@invoice2.id}")
        expect("#{@invoice2.id}").to appear_before("#{@invoice3.id}")
        expect("#{@invoice3.id}").to appear_before("#{@invoice4.id}")
        expect(page).to have_link("Sort A-Z")

        click_link("Sort A-Z")
        expect("#{@invoice1.id}").to appear_before("#{@invoice2.id}")
        expect("#{@invoice2.id}").to appear_before("#{@invoice3.id}")
        expect("#{@invoice3.id}").to appear_before("#{@invoice4.id}")
      end
      
      it 'can sort by most recent date' do
        visit "/merchants/#{@merchant1.id}/invoices"
        
        expect("#{@invoice1.id}").to appear_before("#{@invoice2.id}")
        expect("#{@invoice2.id}").to appear_before("#{@invoice3.id}")
        expect("#{@invoice3.id}").to appear_before("#{@invoice4.id}")
        expect(page).to have_link("Sort By Most Recent")
        
        click_link("Sort By Most Recent")

        expect("#{@invoice3.id}").to appear_before("#{@invoice1.id}")
        expect("#{@invoice1.id}").to appear_before("#{@invoice4.id}")
        expect("#{@invoice4.id}").to appear_before("#{@invoice2.id}")
      end
    end
  end
end