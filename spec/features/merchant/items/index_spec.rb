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
    # @item5 = Item.create!(
    #   id: 5,
    #   name: "Item Expedita Aliquam",
    #   description: "Voluptate aut labore qui illum tempore eius. Corrupti cum et rerum. Enim illum labore voluptatem dicta consequatur. Consequatur sunt consequuntur ut officiis.",
    #   unit_price: 68723,
    #   merchant_id: @merchant2.id
    # )
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

  xit "has a button to disable or enable the item" do
    visit "merchants/#{@merchant2.id}/items"
    # save_and_open_page
    # Next to each item name I see a button to disable or enable that item.
# When I click this button
    expect(page).to have_content(@item4.name)
    expect(button).to have_content("Disable")
    click_button "Disable"
    expect(current_path).to eq("merchants/#{@merchant2.id}/items")
    expect(page).to have_content(@item4.name)
    expect(button).to have_content("Enable")
    # Then I am redirected back to the items index
# And I see that the items status has changed


  
  end
end