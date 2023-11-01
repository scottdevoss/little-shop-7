require 'rails_helper'

RSpec.describe '/admin' do
  describe 'as an admin' do
    describe 'when I visit admin dashboard (/admin)' do
      it 'shows a header indicating that I am on the admin dashboard' do
        #US 19
        visit '/admin'

        expect(page).to have_content("Little Etsy Shop")
        save_and_open_page
        expect(page).to have_content("Admin Dashboard")
        expect("Little Etsy Shop").to appear_before("Admin Dashboard")
      end
    end
  end
end