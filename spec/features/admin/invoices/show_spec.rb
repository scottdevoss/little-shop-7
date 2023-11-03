require 'rails_helper'

RSpec.describe 'admin invoices show page' do
  describe 'as an admin' do
    describe 'when I visit admin invoices show page (/admin/invoices/:id)' do
      before :each do
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
        save_and_open_page
        expect(page).to have_content(@invoice9.status)
        expect(page).to have_content(@invoice9.id)
        expect(page).to have_content("Created Wednesday, March 7, 2012")
        expect(page).to have_content(@customer7.full_name)
      end
    end
  end
end