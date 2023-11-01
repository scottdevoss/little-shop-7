require "rails_helper"

RSpec.describe "Merchant Item Show Page", type: :feature do
  before(:each) do
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")
    @item1 = Item.create!(
      id: 1,
      name: "Item Qui Esse",
      description:
      "Nihil autem sit odio inventore deleniti.",
      unit_price: 75107,
      merchant_id: @merchant1.id
    )
  end

  it "shows a merchant's item's attributes" do
    visit "/merchants/#{@merchant1.id}/items"

    expect(page).to have_link("Item Qui Esse")

    click_link("Item Qui Esse")

    expect(current_path).to eq("/merchants/#{@merchant1.id}/items/#{@item1.id}")
    expect(page).to have_content("Name: Item Qui Esse")
    expect(page).to have_content("Description: #{@item1.description}")
    expect(page).to have_content("Current Selling Price: #{@item1.unit_price}")
  end
end