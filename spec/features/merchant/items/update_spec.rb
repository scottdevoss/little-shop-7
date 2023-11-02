require "rails_helper"

RSpec.describe "Merchant Items Update Page", type: :feature do
  before(:each) do
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")
    @merchant2 = Merchant.create!(name: "Arnold's Armoire")
    @item1 = Item.create!(
      id: 1,
      name: "Item Qui Esse",
      description:
      "Nihil autem sit odio inventore deleniti.",
      unit_price: 75107,
      merchant_id: @merchant1.id
    )
    @item2 = Item.create!( 
      id: 2,
      name: "Item Autem Minima",
      description:
      "Cumque consequuntur ad.",
      unit_price: 67076,
      merchant_id: @merchant1.id
    )
    @item3 = Item.create!(
      id: 3,
      name: "Item Ea Voluptatum",
      description:
      "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.",
      unit_price: 32301,
      merchant_id: @merchant1.id
    )
    @item4 = Item.create!(
      id: 4,
      name: "Item Nemo Facere",
      description: "Sunt eum id eius magni consequuntur delectus veritatis.",
      unit_price: 4291,
      merchant_id: @merchant2.id
    )
  end

  it "can update a merchant item" do
    visit "/merchants/#{@merchant1.id}/items"
    click_link("Item Qui Esse")

    expect(page).to have_link("Update Item")

    click_link("Update Item")

    expect(current_path).to eq(edit_merchant_item_path(@merchant1, @item1))

    fill_in "Name", with: "Qui Esse"
    click_button("Update Item")
    
    expect(current_path).to eq("/merchants/#{@merchant1.id}/items/#{@item1.id}")
    
    expect(page).to have_content("Qui Esse")
    expect(page).to have_content("Nihil autem sit odio inventore deleniti.")
    expect(page).to have_content(75107)
    expect(page).to_not have_content("Item Qui Esse")
    
    expect(page).to have_content("Item successfully updated")
  end
end