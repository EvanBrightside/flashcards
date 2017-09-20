require 'rails_helper'
require 'support/login_helper'

RSpec.feature 'Card', type: :feature do
  describe 'Card tasks' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:deck) { FactoryGirl.create(:deck) }
    let!(:card) { FactoryGirl.create(:card, user: user, deck: deck) }

    before do
      login("hello@gmail.com", "user12345")
      visit root_path
      user.decks.create(name: 'First_Deck')
    end

    context "card checking" do
      let!(:second_card) { FactoryGirl.create(:card, user: user, deck: deck) }

      it 'successfull message after correct checking' do
        fill_in 'Enter the translation', with: 'Hello'
        click_button 'Check it!'

        expect(page).to have_content 'Yep!'
      end

      it 'failed message after incorrect checking' do
        fill_in 'Enter the translation', with: 'Hella'
        click_button 'Check it!'

        expect(page).to have_content 'No!'
      end
    end

    it 'correct message after all cards checked' do
      fill_in 'Enter the translation', with: 'Hello'
      click_button 'Check it!'

      expect(page).to have_content 'All cards done!'
    end

    context 'card actions' do
      it "create a card" do
        visit new_card_path
        fill_in 'Original text', with: 'Привет'
        fill_in 'Translated text', with: 'Hello'
        select 'First_Deck', from: 'card[deck_id]'

        click_button 'Create Card'
        expect(page).to have_content 'Your Card'
      end
    end
  end
end
