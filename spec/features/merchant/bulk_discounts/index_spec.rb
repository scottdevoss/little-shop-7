require "rails_helper" 

# And each bulk discount listed includes a link to its show page
RSpec.describe "Bulk Discounts Index Page" do 
  it "as a Merchant, when I visit my merchant dashboard, then I see a link to view all my discounts " do 

    visit "merchants/#{merchant.id}/dashboard"

    expect(page).to have_link "View My Discounts"
  end

  it "when I click this link, I am taken to my bulk discounts index page where I see the percentage discount and quantity thresholds for all my bulk discounts" do 

    visit "merchants/#{merchant.id}/dashboard"

    click_link "View My Discounts" 

    expect(current_path).to eq("merchants/#{merchant.id}/bulk_discounts")

    within "#discount-#{discount.id}" do 
      expect(page).to have_content("20% off of 10 items")
      expect(page).to have_content("30% off of 15 items")
      expect(page).to have_content("35% off of 20 items")
    end
  end

  it "each bulk discount listed includes a link to its show page" do 

    

    Discount.each.with_index do |discount, idx| 
      visit "merchants/#{merchant.id}/bulk_discounts"
      within "#discount-#{discount.id}" do 
        expect(page).to have_link(discount.name)
        click_link "#{discount.name}"
        expect(current_path).to eq("merchants/#{merchant.id}/bulk_discounts/#{discount.id}")
        expect(page).to have_content("@discount#{idx}.name")
      end
    end
  end

end 