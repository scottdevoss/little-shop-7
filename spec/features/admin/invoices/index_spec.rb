require 'rails_helper'

RSpec.describe 'admin invoices index' do
  describe 'as an admin' do
    describe 'when I visit admin invoices index (/admin/invoices)' do
      before :each do
        @customer1 = Customer.create!(first_name: "Joey", last_name: "Ondricka")
        @customer2 = Customer.create!(first_name: "Cecelia", last_name: "Osinski")
        @customer3 = Customer.create!(first_name: "Mariah", last_name: "Toy")
        @customer4 = Customer.create!(first_name: "Leanne", last_name: "Braun")
        @customer5 = Customer.create!(first_name: "Sylvester", last_name: "Nader")
        @customer6 = Customer.create!(first_name: "Heber", last_name: "Kuhn")
        @customer7 = Customer.create!(first_name: "Parker", last_name: "Daugherty")

        @invoice4 = Invoice.create!(status: "completed", customer_id: @customer4.id, created_at: "2012-03-24 15:54:10 UTC", updated_at: "2012-03-24 15:54:10 UTC", id: 100004)
        @invoice3 = Invoice.create!(status: "completed", customer_id: @customer3.id, created_at: "2012-03-10 00:54:09 UTC", updated_at: "2012-03-10 00:54:09 UTC", id: 100003)
        @invoice1 = Invoice.create!(status: "completed", customer_id: @customer1.id, created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC", id: 100001)
        @invoice2 = Invoice.create!(status: "completed", customer_id: @customer2.id, created_at: "2012-03-12 05:54:09 UTC", updated_at: "2012-03-12 05:54:09 UTC", id: 100002)
        @invoice5 = Invoice.create!(status: "completed", customer_id: @customer5.id, created_at: "2012-03-07 19:54:10 UTC", updated_at: "2012-03-07 19:54:10 UTC", id: 100005)
        @invoice6 = Invoice.create!(status: "completed", customer_id: @customer6.id, created_at: "2012-03-09 01:54:10 UTC", updated_at: "2012-03-09 01:54:10 UTC", id: 100006)
        @invoice8 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-13 16:54:10 UTC", updated_at: "2012-03-13 16:54:10 UTC", id: 100008)
        @invoice7 = Invoice.create!(status: "completed", customer_id: @customer7.id, created_at: "2012-03-07 21:54:10 UTC", updated_at: "2012-03-07 21:54:10 UTC", id: 100007)
        @invoice10 = Invoice.create!(status: "cancelled", customer_id: @customer7.id, created_at: "2012-03-06 21:54:10 UTC", updated_at: "2012-03-06 21:54:10 UTC", id: 100010)
        @invoice9 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC", id: 100009)
        @invoice11 = Invoice.create!(status: "in progress", customer_id: @customer7.id, created_at: "2012-03-08 20:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC", id: 100011)

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

      it 'has all invoice ids in system as links to invoice show page' do
        visit "/admin/invoices"

        expect(page).to have_link("#{@invoice1.id}")
        expect(page).to have_link("#{@invoice2.id}")
        expect(page).to have_link("#{@invoice3.id}")
        expect(page).to have_link("#{@invoice4.id}")
        expect(page).to have_link("#{@invoice5.id}")
        expect(page).to have_link("#{@invoice6.id}")
        expect(page).to have_link("#{@invoice7.id}")
        expect(page).to have_link("#{@invoice8.id}")
        expect(page).to have_link("#{@invoice9.id}")
        expect(page).to have_link("#{@invoice10.id}")
        expect(page).to have_link("#{@invoice11.id}")

        click_link("#{@invoice1.id}")

        expect(current_path).to eq("/admin/invoices/#{@invoice1.id}")
      end

      # Extension 1-2
      describe "sort by functionality" do
        it 'can sort alphabetically' do
          visit "/admin/invoices"

          expect("#{@invoice4.id}").to appear_before("#{@invoice3.id}")
          expect("#{@invoice3.id}").to appear_before("#{@invoice1.id}")
          expect("#{@invoice1.id}").to appear_before("#{@invoice2.id}")
          expect(page).to have_link("Sort A-Z")

          click_link("Sort A-Z")

          expect("#{@invoice1.id}").to appear_before("#{@invoice2.id}")
          expect("#{@invoice2.id}").to appear_before("#{@invoice3.id}")
          expect("#{@invoice3.id}").to appear_before("#{@invoice4.id}")
        end

        it 'can sort by most recent date' do
          visit "/admin/invoices"

          expect("#{@invoice4.id}").to appear_before("#{@invoice3.id}")
          expect("#{@invoice3.id}").to appear_before("#{@invoice1.id}")
          expect("#{@invoice1.id}").to appear_before("#{@invoice2.id}")
          expect(page).to have_link("Sort By Most Recent")

          click_link("Sort By Most Recent")

          expect("#{@invoice1.id}").to appear_before("#{@invoice4.id}")
          expect("#{@invoice4.id}").to appear_before("#{@invoice8.id}")
          expect("#{@invoice8.id}").to appear_before("#{@invoice2.id}")
        end
      end
    end
  end
end