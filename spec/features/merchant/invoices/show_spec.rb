require 'rails_helper'

RSpec.describe 'merchant invoices show page' do
  before (:each) do
    load_test_data
  end

  describe "When I visit merchants invoice show page" do
    it "I see information related to that invoice including (invoice_id, invoice status, invoice created_at, customer first and last name)" do
      visit "/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}"

      expect(page).to have_content("ID: #{@invoice1.id}")
      expect(page).to have_content("Status: #{@invoice1.status}")
      expect(page).to have_content("Created on: #{@invoice1.creation_date}")
      expect(page).to have_content("Customer: #{@invoice1.customer_name}")
    end

    it "I see all of my items information on the invoice (Item name, quantity, price, invoice status)" do
      visit "/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}"

      @invoice1.invoice_items.each do |invoice_item|
        expect(page).to have_content(invoice_item.item.name)
        expect(page).to have_content(invoice_item.quantity)
        expect(page).to have_content(invoice_item.unit_price)
        expect(page).to have_content(invoice_item.status)
      end
    end
    it 'shows the total revenue' do
      visit "/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}"
      expect(page).to have_content("$2,900.00")
    end

    it 'allows you to update item status' do
      visit "/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}"

      expect(page).to have_select("status_#{@invoice_item1.id}", selected: "#{@invoice_item1.status}")
      expect(page).to have_button("Update #{@item1.name}")
      
      select "pending", from: "status_#{@invoice_item1.id}"
      click_button("Update #{@item1.name}")
      @invoice_item1.reload
      expect(@invoice_item1.status).to eq("pending")
      
      expect(current_path).to eq("/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}")
      expect(page).to have_select("status_#{@invoice_item1.id}", selected: "#{@invoice_item1.status}")
      
      select "packaged", from: "status_#{@invoice_item1.id}"
      click_button("Update #{@item1.name}")
      @invoice_item1.reload
      expect(@invoice_item1.status).to eq("packaged")
      
      expect(current_path).to eq("/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}")
      expect(page).to have_select("status_#{@invoice_item1.id}", selected: "#{@invoice_item1.status}")
      
      select "shipped", from: "status_#{@invoice_item1.id}"
      click_button("Update #{@item1.name}")
      @invoice_item1.reload
      expect(@invoice_item1.status).to eq("shipped")
      
      expect(current_path).to eq("/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}")
    end

    it "calculates the total revenue included in the invoice without applying any bulk discounts" do 
      visit "/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}"

      expect(page).to have_content("Total Revenue (no discounts applied): $2,900.00")
    end
    
    it "calculates total revenue after applying bulk discounts" do 
      visit "/merchants/#{@merchant1.id}/invoices/#{@invoice1.id}"
      
      expect(page).to have_content("Total Revenue (WITH discounts applied): $2,500.00")
      save_and_open_page
    end
  end

end 