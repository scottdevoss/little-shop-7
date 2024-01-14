require "rails_helper"

RSpec.describe "Bulk Discount Show Page" do 
  before(:each) do 
    @merchant1 = Merchant.create!(name: "Hannah's Handbags")
    @merchant2 = Merchant.create!(name: "American Furniture Warehouse")
    @discount1 = Discount.create!(discount: 20, qty: 10, merchant_id: @merchant1.id)
    @discount2 = Discount.create!(discount: 30, qty: 15, merchant_id: @merchant2.id)
    @discount3 = Discount.create!(discount: 35, qty: 20, merchant_id: @merchant1.id)
  end

  it "it displays a bulk discount's quantity threshold and percentage discount" do 
    
    visit "/merchants/#{@merchant1.id}/discounts/#{@discount1.id}"

    expect(page).to have_content("#{@merchant1.name}'s #{@discount1.discount}% Off Discount")
    expect(page).to have_content("discount %: 20")
    expect(page).to have_content("quantity: 10")

    visit "/merchants/#{@merchant2.id}/discounts/#{@discount2.id}"

    expect(page).to have_content("#{@merchant2.name}'s #{@discount2.discount}% Off Discount")
    expect(page).to have_content("discount %: 30")
    expect(page).to have_content("quantity: 15")
  end
end 
