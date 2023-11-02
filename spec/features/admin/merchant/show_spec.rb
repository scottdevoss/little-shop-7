require "rails_helper"

RSpec.describe "Admin Merchant Show Page" do 
  it "a user can click on any Merchant in Admin Merchant Index to get taken to that Merchan'ts Show Page" do 
    # as an admin
    merchant = Merchant.create!({name: "Schroeder-Jerde"})

    visit "/admin/merchants"

    click_link merchant.name

    expect(current_path).to eq("/admin/merchants/#{merchant.id}")
    expect(page).to have_content("#{merchant.name}")
  end

  it "can update the merchant's information" do 
    # as an admin
    merchant = Merchant.create!({name: "Schroeder-Jerde"})

    visit "/admin/merchants/#{merchant.id}"

    expect(page).to have_link("Update")

    click_link("Update")

    visit "/admin/merchants/#{merchant.id}/edit"

    expect(page).to have_content("Edit Merchant")

    fill_in :name, with: merchant.name

    expect(page).to have_field(:name)
    
    fill_in :name, with: "Schroeder-Jerde-Andersen"
    
    expect(page).to have_button("Submit")
    
    click_button "Submit"
    
    expect(current_path).to eq("/admin/merchants/#{merchant.id}")
    expect(page).to have_content( "Schroeder-Jerde-Andersen")
    expect(page).to have_content("The information has been successfully updated.")
  end

end 