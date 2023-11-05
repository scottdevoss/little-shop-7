require "rails_helper"

RSpec.describe "Admin Merchants Index", type: feature do

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
  
end 