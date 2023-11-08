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
      
        within("#top-five-#{@customer1.id}") do
          expect(page).to have_content(@customer1.full_name)
          expect(page).to have_content("Successful Orders: 3")
        end
        within("#top-five-#{@customer3.id}") do
          expect(page).to have_content(@customer3.full_name)
          expect(page).to have_content("Successful Orders: 2")
        end
        within("#top-five-#{@customer4.id}") do
          expect(page).to have_content(@customer4.full_name)
          expect(page).to have_content("Successful Orders: 2")
        end
        within("#top-five-#{@customer5.id}") do
          expect(page).to have_content(@customer5.full_name)
          expect(page).to have_content("Successful Orders: 2")
        end
        within("#top-five-#{@customer6.id}") do
          expect(page).to have_content(@customer6.full_name)
          expect(page).to have_content("Successful Orders: 1")
        end
        expect(page).to_not have_content("#{@customer2.full_name}")
      end

      # US 22, Admin Dashboard Incomplete Invoices
      it 'has a section for incomplete invoices' do
        visit '/admin'

        expect(page).to have_content("Incomplete Invoices")
        within('section', :text => "Incomplete Invoices") do
          expect(page).to have_link("#{@invoice8.id}")
          expect(page).to have_link("#{@invoice9.id}")
          expect(page).to_not have_link("#{@invoice7.id}")
          expect(page).to_not have_link("#{@invoice10.id}")
          expect(page).to have_link("#{@invoice11.id}")
        end

        click_link("#{@invoice8.id}")

        expect(current_path).to eq("/admin/invoices/#{@invoice8.id}")
      end

      # US 23, Admin Dashboard Invoices sorted by least recent
      it 'has invoice created date ordered by oldest to newest' do
        visit '/admin'

        expect(page).to have_content("Incomplete Invoices")
        within('section', :text => "Incomplete Invoices") do
          expect("#{@invoice9.id}").to appear_before("#{@invoice11.id}")
          expect("#{@invoice11.id}").to appear_before("#{@invoice8.id}")
          expect(page).to have_content("#{@invoice9.id}: Created Wednesday, March 7, 2012")
          expect(page).to have_content("#{@invoice11.id}: Created Thursday, March 8, 2012")
          expect(page).to have_content("#{@invoice8.id}: Created Tuesday, March 13, 2012")
        end
      end

       # Extension 1-2
      describe "sort by functionality" do
        it 'can sort alphabetically' do
          visit "/admin"
          within('section', :text => "Incomplete Invoices") do
            expect("#{@invoice9.id}").to appear_before("#{@invoice11.id}")
            expect("#{@invoice11.id}").to appear_before("#{@invoice8.id}")
          end

          expect(page).to have_link("Sort A-Z")
            
          click_link("Sort A-Z")
          
          within('section', :text => "Incomplete Invoices") do
            expect("#{@invoice8.id}").to appear_before("#{@invoice9.id}")
            expect("#{@invoice9.id}").to appear_before("#{@invoice11.id}")
          end
        end
        
        it 'can sort by most recent date' do
          visit "/admin"
          within('section', :text => "Incomplete Invoices") do
            expect("#{@invoice9.id}").to appear_before("#{@invoice11.id}")
            expect("#{@invoice11.id}").to appear_before("#{@invoice8.id}")
          end

          expect(page).to have_link("Sort By Most Recent")

          click_link("Sort By Most Recent")

          within('section', :text => "Incomplete Invoices") do
            expect("#{@invoice8.id}").to appear_before("#{@invoice11.id}")
            expect("#{@invoice11.id}").to appear_before("#{@invoice9.id}")
          end
        end
      end
    end
  end
end