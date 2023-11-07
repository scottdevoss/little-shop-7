require "rails_helper"

RSpec.describe "creating a new Merchant" do
  it "links to the page from the admin merchants index" do 
    visit admin_merchants_path

    click_link("Create a new merchant")
    expect(current_path).to eq(new_admin_merchant_path)
  end

  it "creates a new merchant" do 
    new_merchant = create(:merchant)

    visit new_admin_merchant_path
    fill_in("Name", with: new_merchant.name)
    click_button("Submit")
    expect(current_path).to eq("/admin/merchants")

    within(".disabled") do 
      expect(page).to have_content(new_merchant.name)
    end

    within("#index-#{new_merchant.id}") do
      expect(page).to have_button("Enable")
    end
  end
  
end 