require 'rails_helper'
require 'support/login_helper'

RSpec.feature 'Decks', type: :feature do
	let!(:user) { FactoryGirl.create(:user) }

  context 'create' do
    before do
      login("hello@gmail.com", "user12345")
      visit root_path
    end

    it { expect(page).to have_content 'All cards done! Please choose another DECK!!!' }

    context 'create new deck' do
      before { click_link 'Add a deck' }

			it 'add a deck' do
        fill_in 'Deck name', with: 'First Deck'
        click_button 'Create a Deck'

      	expect(page).to have_content 'Your Deck'
      end
    end
  end
end
