require 'rails_helper'

RSpec.describe 'as a user' do
  context 'on the root path' do
    it 'can search for foods' do
      # As a user,
      # When I visit "/"
      visit root_path
      # And I fill in the search form with "sweet potatoes"
      fill_in :q, with: 'sweet potatoes'
      # And I click "Search"
      click_button 'Search'
      # Then I should be on page "/foods"
      expect(current_path).to eq('/foods')
      # Then I should see a total of the number of items returned by the search. (531 for sweet potatoes)
      expect(page).to have_content('Total Results: 531')
      # Then I should see a list of ten foods sorted by relevance.
      expect(page).to have_css('.food', count: 10)
      # And for each of the foods I should see:
      # - The food's NDB Number
      # - The food's name
      # - The food group to which the food belongs
      # - The food's data source
      # - The food's manufacturer
      within first('.food') do
        expect(page).to have_css('.ndb')
        expect(page).to have_css('.name')
        expect(page).to have_css('.group')
        expect(page).to have_css('.data_source')
        expect(page).to have_css('.manufacturer')
      end
    end
  end
end



