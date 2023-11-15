require "rails_helper"

RSpec.describe "Bulk Discount Show Page" do 
  before(:each) do 
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")
    @merchant2 = Merchant.create!(name: "American Furniture Warehouse")
    @discount1 = Discount.create!(discount: 20, qty: 10, merchant_id: @merchant1.id)
    @discount2 = Discount.create!(discount: 30, qty: 15, merchant_id: @merchant2.id)
    @discount3 = Discount.create!(discount: 35, qty: 20, merchant_id: @merchant1.id)
  end

  it "allows users to edit the bulk discount" do 
    visit "/merchants/#{@merchant1.id}/discounts/#{@discount3.id}"
    expect(page).to have_content("#{@merchant1.name}'s #{@discount3.discount}% Off Discount")
    expect(page).to have_content("discount %: 35")
    expect(page).to have_content("quantity: 20")
    expect(page).to have_link("Edit")
    click_link "Edit"

    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/#{@discount3.id}/edit")
    
    expect(page).to have_content("Edit #{@merchant1.name}'s #{@discount3.discount}% Off Discount")
    expect(page).to have_field(:new_rate)
    expect(page).to have_field(:threshold)
    expect(page).to have_button("Submit")

    fill_in :new_rate, with: 50
    fill_in :threshold, with: 50
    
    click_button("Submit")

    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/#{@discount3.id}")
    expect(page).to have_content("50% Off Discount")
    expect(page).to have_content("discount %: 50")
    expect(page).to have_content("quantity: 50")

    expect(page).to_not have_content("35% Off Discount")
    expect(page).to_not have_content("discount %: 35")
    expect(page).to_not have_content("quantity: 20")
  end
end