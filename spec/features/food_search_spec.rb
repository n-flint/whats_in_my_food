require 'rails_helper'

RSpec.describe 'as a user' do
  context 'on the root path' do
    it 'can search for foods' do
      visit root_path

      fill_in :q, with: 'sweet potatoes'

      click_button 'Search'

      expect(current_path).to eq('/foods')
      expect(page).to have_content('Total Results: 531')
      expect(page).to have_css('.food', count: 10)
      within first('.food') do
        expect(page).to have_css('.ndbno')
        expect(page).to have_css('.name')
        expect(page).to have_css('.group')
        expect(page).to have_css('.ds')
        expect(page).to have_css('.manu')
      end
    end
  end
end



