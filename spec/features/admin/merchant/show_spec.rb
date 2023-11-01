require "rails_helper"

RSpec.describe "Admin Merchant Show Page" do 
  it "a user can click on any Merchant in Admin Merchant Index to get taken to that Merchan'ts Show Page" do 
    merchant = Merchant.create!({name: "Schroeder-Jerde"})

    visit "/admin/merchants"

    click_link merchant.name

    expect(current_path).to eq("/admin/merchants/#{merchant.id}")
    expect(page).to have_content("#{merchant.name}")
  end

end 