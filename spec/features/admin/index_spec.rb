require 'rails_helper'

RSpec.describe '/admin' do
  describe 'as an admin' do
    describe 'when I visit admin dashboard (/admin)' do
      before :each do
        @customer1 = Customer.create!(first_name: "Joey", last_name: "Ondricka")
        @customer2 = Customer.create!(first_name: "Cecelia", last_name: "Osinski")
        @customer3 = Customer.create!(first_name: "Mariah", last_name: "Toy")
        @customer4 = Customer.create!(first_name: "Leanne", last_name: "Braun")
        @customer5 = Customer.create!(first_name: "Sylvester", last_name: "Nader")
        @customer6 = Customer.create!(first_name: "Heber", last_name: "Kuhn")
        @customer7 = Customer.create!(first_name: "Parker", last_name: "Daugherty")

        @invoice1 = Invoice.create!(status: "completed", customer_id: @customer1.id)
        @invoice2 = Invoice.create!(status: "completed", customer_id: @customer2.id)
        @invoice3 = Invoice.create!(status: "completed", customer_id: @customer3.id)
        @invoice4 = Invoice.create!(status: "completed", customer_id: @customer4.id)
        @invoice5 = Invoice.create!(status: "completed", customer_id: @customer5.id)
        @invoice6 = Invoice.create!(status: "completed", customer_id: @customer6.id)
        @invoice7 = Invoice.create!(status: "completed", customer_id: @customer7.id)

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
      it 'shows a header indicating that I am on the admin dashboard' do
        #US 19
        visit '/admin'

        expect(page).to have_content("Little Etsy Shop")
        expect(page).to have_content("Admin Dashboard")
        expect("Little Etsy Shop").to appear_before("Admin Dashboard")
      end

        # US 20, Admin Dashboard Links
      it "has link to admin merchants index (/admin/merchants)" do
        visit "/admin"
        
        expect(page).to have_link("Merchants")

        click_link("Merchants")

        expect(current_path).to eq("/admin/merchants")
      end

      it "has link to admin invoices index (/admin/invoices)" do
        visit "/admin"
        
        expect(page).to have_link("Invoices")

        click_link("Invoices")
        
        expect(current_path).to eq("/admin/invoices")
      end

      # US 21, Admin Dashboard Statistics - Top Customers
      it 'gives names of the top 5 customers' do
        visit '/admin'
    
        expect(page).to have_content(@customer1.full_name)
        expect(page).to have_content(@customer3.full_name)
        expect(page).to have_content(@customer4.full_name)
        expect(page).to have_content(@customer5.full_name)
        expect(page).to have_content(@customer6.full_name)
        expect(page).to_not have_content(@customer2.full_name)
      end

      it 'gives number of successful transactions they have conducted' do
        visit '/admin'
 
        expect(page).to have_content("#{@customer1.full_name}: 3 successful orders")
        expect(page).to have_content("#{@customer3.full_name}: 2 successful orders")
        expect(page).to have_content("#{@customer4.full_name}: 2 successful orders")
        expect(page).to have_content("#{@customer5.full_name}: 2 successful orders")
        expect(page).to have_content("#{@customer6.full_name}: 1 successful orders")
        expect(page).to_not have_content("#{@customer2.full_name}")
      end
    end
  end
end