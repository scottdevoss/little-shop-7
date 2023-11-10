require "rails_helper"

RSpec.describe "Admin Merchants Index", type: feature do
  before(:each) do 
    @merchant1 = Merchant.create!(name: "Hannah's Handbags", created_at: "2012-03-11 15:54:10 UTC")
    @merchant2 = Merchant.create!(name: "Arnold's Armoire", created_at: "2012-03-24 00:54:09 UTC")
    @merchant3 = Merchant.create!(name: "Schroeder-Jerde", created_at: "2012-03-10 00:54:09 UTC")
    @merchant4 = Merchant.create!(name: "Klein, Rempel and Jones", created_at: "2012-03-09 00:54:09 UTC")
    @merchant5 = Merchant.create!(name: "Pollich and Sons")
    @merchant6 = Merchant.create!(name: "Bosco, Howe and Davis")
    @merchant7 = Merchant.create!(name: "Kiehn Group")
    @merchant8 = Merchant.create!(name: "Smitham LLC")
    @merchant9 = Merchant.create!(name: "Gibson Group")

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
      merchant_id: @merchant2.id
    )
    @item4 = Item.create!(
      name: "Item Nemo Facere",
      description: "Sunt eum id eius magni consequuntur delectus veritatis.",
      unit_price: 4291,
      merchant_id: @merchant3.id
    )
    
    @item5 = Item.create!(name: "Gold Ring", unit_price: 1200, merchant_id: @merchant4.id, description: "14k Gold")
    @item6 = Item.create!(name: "Silver Ring", unit_price: 900, merchant_id: @merchant5.id, description: "Pure Silver")
    @item7 = Item.create!(name: "Gold Necklace", unit_price: 1400, merchant_id: @merchant6.id, description: "10k Gold")
    @item8 = Item.create!(name: "Silver Necklace", unit_price: 1000, merchant_id: @merchant7.id, description: "Pure Silver")
    @item9 = Item.create!(name: "Hair Clip", unit_price: 25, merchant_id: @merchant8.id, description: "Black Plastic")
    @item10 = Item.create!(name: "Hoop Earrings", unit_price: 125, merchant_id: @merchant9.id, description: "Bronze")
    @item11 = Item.create!(name: "Platinum Bracelet", unit_price: 800, merchant_id: @merchant9.id, description: "Platinum")
    @item12 = Item.create!(name: "Custom Watch", unit_price: 310, merchant_id: @merchant4.id, description: "Silver")

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
    @invoice8 = Invoice.create!(status: 2, customer_id: @customer2.id)
    @invoice9 = Invoice.create!(status: 2, customer_id: @customer2.id)
    @invoice10 = Invoice.create!(status: 2, customer_id: @customer3.id)
    @invoice10 = Invoice.create!(status: 2, customer_id: @customer4.id)
    @invoice10 = Invoice.create!(status: 2, customer_id: @customer3.id)

    @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 111, status: 1) 
    @invoice_item2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 1, unit_price: 345, status: 1) 
    @invoice_item3 = InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice3.id, quantity: 1, unit_price: 420, status: 1) 
    @invoice_item4 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 345, status: 1) 
    @invoice_item5 = InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice5.id, quantity: 1, unit_price: 420, status: 1) 
    @invoice_item6 = InvoiceItem.create!(item_id: @item5.id, invoice_id: @invoice6.id, quantity: 1, unit_price: 345, status: 1) 
    @invoice_item7 = InvoiceItem.create!(item_id: @item6.id, invoice_id: @invoice7.id, quantity: 1, unit_price: 711, status: 1)
    @invoice_item8 = InvoiceItem.create!(item_id: @item8.id, invoice_id: @invoice8.id, quantity: 1, unit_price: 711, status: 1)
    @invoice_item9 = InvoiceItem.create!(item_id: @item10.id, invoice_id: @invoice9.id, quantity: 1, unit_price: 345, status: 1)
    @invoice_item10 = InvoiceItem.create!(item_id: @item8.id, invoice_id: @invoice10.id, quantity: 1, unit_price: 126, status: 1)
    @invoice_item11 = InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice2.id, quantity: 1, unit_price: 123, status: 1)
    @invoice_item12 = InvoiceItem.create!(item_id: @item7.id, invoice_id: @invoice8.id, quantity: 1, unit_price: 345, status: 1)
    @invoice_item13 = InvoiceItem.create!(item_id: @item11.id, invoice_id: @invoice4.id, quantity: 1, unit_price: 345, status: 1)
    @invoice_item14 = InvoiceItem.create!(item_id: @item12.id, invoice_id: @invoice6.id, quantity: 1, unit_price: 345, status: 1)
    @invoice_item15 = InvoiceItem.create!(item_id: @item10.id, invoice_id: @invoice10.id, quantity: 1, unit_price: 345, status: 1)
    @invoice_item16 = InvoiceItem.create!(item_id: @item7.id, invoice_id: @invoice10.id, quantity: 1, unit_price: 345, status: 1)

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
  end

  it "displays the name of each merchant in the system" do 
    merch_list = create_list(:merchant, 5)

    visit "/admin/merchants"

    merch_list.each do |merch|
      expect(page).to have_content(merch.name)
    end
  end
  
  it "has a button next to each merchant's name to disable or enable that merchant" do 
    merch_list = create_list(:merchant, 5)
    merchant = merch_list.sample
    
    visit "/admin/merchants"

    within ".disabled" do
      within "#index-#{merchant.id}" do 
        expect(page).to have_content(merchant.name)
        expect(page).to have_button("Enable")
        click_button "Enable"
      end
    end

    expect(current_path).to eq("/admin/merchants")
    expect(page).to have_content("The status has been enabled")

    within ".enabled" do
      expect(page).to have_link(merchant.name)
      expect(page).to have_button("Disable")
      click_button "Disable"
    end
  
    expect(current_path).to eq("/admin/merchants")
    expect(page).to have_content("The status has been disabled")

    within ".disabled" do
      expect(page).to_not have_link(merchant.name)
      expect(page).to have_button("Enable")
    end
  end

  it "displays merchants in two sections - 'Enabled Merchants' and 'Disabled Merchants'" do 
    # reset db, all merchants 'enabled', which is the default value in schema
    merch_list = create_list(:merchant, 8)
    
    visit "/admin/merchants"

    expect(page).to have_content("Enabled Merchants")
    expect(page).to have_content("Disabled Merchants")
    # check that all merchants are enabled
    merch_list.each do |merch|
      within ".disabled" do 
        expect(page).to have_content(merch.name)
      end

      within ".enabled" do 
        expect(page).to_not have_content(merch.name)
      end
    end
    
    # disable four merchants with lowest id's
    idx = Merchant.minimum(:id)
    stop = idx + 3
    
    while idx <= stop
      merch = Merchant.find(idx)
      merch.update({status: 0})
      idx += 1
    end
    
    merch_list_enabled = Merchant.where("id <= ?", stop)
    merch_list_disabled = Merchant.where("id > ?", stop)

    # disable the first four companies
    merch_list_enabled.each do |merch| 
      merch.update({status: 1})
    end

    visit "/admin/merchants"
    
    # check to make sure half of the merchants are in 'enabled' section and other half are in the 'disabled' section
    merch_list_enabled.each do |merch|
      within ".enabled" do 
        expect(page).to have_content(merch.name)
      end
    end

    merch_list_disabled.each do |merch|
      within ".disabled" do
        expect(page).to have_content(merch.name)
      end
    end
  end

  it "displays the names of the top 5 merchants by total revenue generated" do 
    # merchants to customers to invoice to invoice items
    # revenue =>

    load_test_data
    sample = load_test_data
    require 'pry'; binding.pry
    visit "/admin/merchants"

    within("#top-five-merch-#{@merchant9.id}") do
      expect(page).to have_link "Gibson Group"
      expect(page).to have_content("$940.00")
    end

    within("#top-five-merch-#{@merchant7.id}") do
      expect(page).to have_link "Kiehn Group"
      expect(page).to have_content("$837.00")
    end 

    within("#top-five-merch-#{@merchant1.id}") do
      expect(page).to have_link "Hannah's Handbags"
      expect(page).to have_content("$801.00")
    end

    within("#top-five-merch-#{@merchant5.id}") do
      expect(page).to have_link "Pollich and Sons"
      expect(page).to have_content("$711.00")
    end

    within("#top-five-merch-#{@merchant4.id}") do
      expect(page).to have_link "Klein, Rempel and Jones"
      expect(page).to have_content("$690.00")
    end

    within("#top-five-outer-container") do
      expect("Gibson Group").to appear_before("Kiehn Group")
      expect("940.00").to appear_before("$837.00")

      expect("Kiehn Group").to appear_before("Hannah's Handbags")
      expect("$837.00").to appear_before("$801.00")

      expect("Hannah's Handbags").to appear_before("Pollich and Sons")
      expect("$801.00").to appear_before("$711.00")

      expect("Pollich and Sons").to appear_before("Klein, Rempel and Jones")
      expect("$711.00").to appear_before("$690.00")
    end
  end

    it "displays the highest revenue date next to each of the top 5 merchants" do
      load_test_data      
      #When I visit the admin merchants index
      visit "admin/merchants/"
      # Then next to each of the 5 merchants by revenue
      # I see the date with the most revenue for each merchant
      
      # _rev = Merchant._by_revenue
      most_rev_date = Merchant.top_5_by_revenue
      save_and_open_page
      most_rev_date.each do |merch| 
        within "#top-five-merch-#{merch.id}" do 
        expect(page).to have_content(merch.name)
        expect(page).to have_content("Top Selling Date for #{merch.name} was #{merch.date_most_rev.strftime("%m/%d/%Y")}")
      end 
    end
  end 

  # Extension 1-2
  describe "sort by functionality" do
    it 'can sort alphabetically' do
      visit "/admin/merchants"
      within ".disabled" do
        expect(@merchant1.name).to appear_before(@merchant2.name)
        expect(@merchant2.name).to appear_before(@merchant3.name)
        expect(@merchant3.name).to appear_before(@merchant4.name)
      end

    expect(page).to have_link("Sort A-Z")
      
    click_link("Sort A-Z")
    
    within ".disabled" do
      expect(@merchant2.name).to appear_before(@merchant1.name)
      expect(@merchant1.name).to appear_before(@merchant4.name)
      expect(@merchant4.name).to appear_before(@merchant3.name)
    end
  end
  
    it 'can sort by most recent date' do
      visit "/admin/merchants"
      within ".disabled" do
        expect(@merchant1.name).to appear_before(@merchant2.name)
        expect(@merchant2.name).to appear_before(@merchant3.name)
        expect(@merchant3.name).to appear_before(@merchant4.name)
      end

      expect(page).to have_link("Sort By Most Recent")

      click_link("Sort By Most Recent")

      within ".disabled" do
        expect(@merchant2.name).to appear_before(@merchant1.name)
        expect(@merchant1.name).to appear_before(@merchant3.name)
        expect(@merchant3.name).to appear_before(@merchant4.name)
      end
    end
  end

end 
