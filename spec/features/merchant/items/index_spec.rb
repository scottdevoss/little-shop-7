require "rails_helper"

RSpec.describe "Merchant Items Index Page", type: :feature do
  before(:each) do
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

  # User Story 6
  it "gives a list of all of a merchant's items" do
    visit "merchants/#{@merchant1.id}/items"

    expect(page).to have_content(@item1.name)
    expect(page).to have_content(@item2.name)
    expect(page).to have_content(@item3.name)
    expect(page).to_not have_content(@item4.name)
  end

  #User Story 11
  describe "I see a link to create a new item - when I click the link, I am taken to a form that allows me to add item information" do
    describe "When I fill out the form I click 'Submit' and I am taken back to the items index page" do
      it "And I see the item I created and I see my item was created with a default status of disabled" do
        visit "/merchants/#{@merchant1.id}/items"
        
        expect(page).to have_link("Create A New Item")
        
        click_link("Create A New Item")
        expect(current_path).to eq("/merchants/#{@merchant1.id}/items/new")

        expect(page).to have_content("Create A New Item")
        expect(page).to have_content("Name:")
        expect(page).to have_content("Description:")
        expect(page).to have_content("Unit Price:")
        expect(page).to have_button("Submit")

        fill_in("Name:", with: "Small Handbag")
        fill_in("Description:", with: "Brown Leather")
        fill_in("Unit Price:", with: 1500)
        
        click_button "Submit"
        expect(current_path).to eq("/merchants/#{@merchant1.id}/items")

        expect(page).to have_link("Small Handbag")
      end
    end
  end

  it "has a button to disable or enable the item" do
    visit "merchants/#{@merchant2.id}/items"
    expect(page).to have_content(@item4.name)
    expect(page).to have_button("Enable")
    click_button "Enable"
    expect(current_path).to eq("/merchants/#{@merchant2.id}/items")

    expect(page).to have_content(@item4.name)
    expect(page).to have_button("Disable")
  end

  describe 'items grouped by status' do
    it 'has an enabled items and disabled items section ' do
      visit "merchants/#{@merchant1.id}/items"
        expect(page).to have_content("Enabled Items")
        expect(page).to have_content("Disabled Items")
    end
    it 'has items divided by section' do
      visit "/merchants/#{@merchant1.id}/items"
      expect("Enabled Items").to appear_before("Disabled Items")
      expect("Disabled Items").to appear_before(@item1.name)
      expect("Disabled Items").to appear_before(@item2.name)
      expect("Disabled Items").to appear_before(@item3.name)
      expect("Disabled Items").to appear_before(@item5.name)
    end
    it 'clicks the button to change the status section of the item' do
      visit "merchants/#{@merchant1.id}/items"
      expect("Disabled Items").to appear_before(@item1.name)
      
      find_button("submit-#{@item1.id}").click
      expect(@item1.name).to appear_before("Disabled Items")
      
      find_button("submit-#{@item2.id}").click
      expect(@item2.name).to appear_before("Disabled Items")
      
      find_button("submit-#{@item3.id}").click
      expect(@item3.name).to appear_before("Disabled Items")
      
      find_button("submit-#{@item1.id}").click
      expect("Disabled Items").to appear_before(@item1.name)
    end
  end
      
  #User Story 12
  describe "Top 5 Most Popular Items" do
    describe "Displays the names of the top 5 most popular items ranked by revenue generated" do
      it "I see each item linked to my merchant show page for an item and I see the total revenue generated next to each item name" do
        visit "/merchants/#{@merchant1.id}/items"

        expect(page).to have_content("Top 5 Most Popular Items:")
        
        within("div.top-5-items") do
          expect(page).to_not have_content("#{@item3.name}")
          expect(page).to_not have_content("#{@item4.name}")
          expect(page).to_not have_content("#{@item5.name}")
          expect(page).to_not have_content("#{@item6.name}")
          expect(page).to_not have_content("#{@item7.name}")

          expect(page).to have_content("#{@item2.name}")
          expect(page).to have_content("#{@item1.name}")
          expect(page).to have_content("#{@item8.name}")
          expect(page).to have_content("#{@item9.name}")
          expect(page).to have_content("#{@item10.name}")

          expect("#{@item2.name}").to appear_before("#{@item1.name}")
          expect("#{@item1.name}").to appear_before("#{@item8.name}")
          expect("#{@item8.name}").to appear_before("#{@item9.name}")
          expect("#{@item9.name}").to appear_before("#{@item10.name}")
        end 
      end

      it "Each item name links to my merchant item show page for that item" do
        visit "/merchants/#{@merchant1.id}/items"

        within("div.top-5-items") do
          expect(page).to have_link("#{@item2.name}")
          expect(page).to have_link("#{@item1.name}")
          expect(page).to have_link("#{@item8.name}")
          expect(page).to have_link("#{@item9.name}")
          expect(page).to have_link("#{@item10.name}")
        end
      end

      it "Displays the total revenue generated next to each item name" do
        visit "/merchants/#{@merchant1.id}/items"

        within("div.top-5-items") do
          expect(page).to have_content("Total Revenue: $#{Item.item_revenue(@item2)}")
          expect(page).to have_content("Total Revenue: $#{Item.item_revenue(@item1)}")
          expect(page).to have_content("Total Revenue: $#{Item.item_revenue(@item8)}")
          expect(page).to have_content("Total Revenue: $#{Item.item_revenue(@item9)}")
          expect(page).to have_content("Total Revenue: $#{Item.item_revenue(@item10)}")
        end 
      end
    end
  end

  #User Story 13
  describe "Next to each most popular item, I see the date with the most sales for each item" do
    it "And I see a label 'Top selling date for was'" do
      visit "/merchants/#{@merchant1.id}/items"

      within("div.top-5-items") do
        expect(page).to have_content("Top selling date for #{@item2.name} was #{Item.item_best_day(@item2).strftime('%-m/%d/%y')}")
        expect(page).to have_content("Top selling date for #{@item1.name} was #{Item.item_best_day(@item1).strftime('%-m/%d/%y')}")
        expect(page).to have_content("Top selling date for #{@item8.name} was #{Item.item_best_day(@item8).strftime('%-m/%d/%y')}")
        expect(page).to have_content("Top selling date for #{@item9.name} was #{Item.item_best_day(@item9).strftime('%-m/%d/%y')}")
        expect(page).to have_content("Top selling date for #{@item10.name} was #{Item.item_best_day(@item10).strftime('%-m/%d/%y')}")
      end
    end
  end
end