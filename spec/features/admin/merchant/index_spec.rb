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

    within "#index-#{merchant.id}" do 
      expect(page).to have_link(merchant.name)
      expect(page).to have_button("Disable")
      click_button "Disable"
    end

    expect(page).to have_content("The status has been disabled")
    
    within "#index-#{merchant.id}" do 
    expect(page).to_not have_link(merchant.name)
    expect(page).to have_button("Enable")
    click_button "Enable"
  end
  
    expect(page).to have_content("The status has been enabled")

    within "#index-#{merchant.id}" do
      expect(page).to have_link(merchant.name)
      expect(page).to have_button("Disable")
    end
  end
  
end 