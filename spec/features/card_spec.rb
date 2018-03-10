require 'rails_helper'
require 'support/login_helper'

RSpec.feature 'Card', type: :feature do
  describe 'Card tasks' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:deck) { FactoryBot.create(:deck) }
    let!(:card) { FactoryBot.create(:card, user: user, deck: deck) }

    before do
      login("hello@gmail.com", "user12345")
      visit root_path
    end

    context "card checking" do
      let!(:second_card) { FactoryBot.create(:card, user: user, deck: deck) }

      it 'successfull message after correct checking' do
        fill_in 'Enter the translation', with: 'Hello'
        click_button 'Check it!'

        expect(page).to have_content 'Correct answer!'
      end

      it 'return message after levenshtein checking' do
        fill_in 'Enter the translation', with: 'Hella'
        click_button 'Check it!'

        expect(page).to have_content 'The correct answer is Hello, you made a typo, your answer was Hella.'
      end

      it 'failed message after incorrect checking' do
        fill_in 'Enter the translation', with: 'Halaa'
        click_button 'Check it!'

        expect(page).to have_content 'Incorrect answer.'
      end
    end

    it 'correct message after all cards checked' do
      fill_in 'Enter the translation', with: 'Hello'
      click_button 'Check it!'

      expect(page).to have_content 'All cards done! Please choose another DECK!!!'
    end

    context 'card actions' do
      it "create a card" do
        visit new_card_path
        fill_in 'Original text', with: 'Привет'
        fill_in 'Translated text', with: 'Hello'
        select 'First_deck', from: 'card[deck_id]'

        click_button 'Create a card'
        expect(page).to have_content 'Your card'
      end
    end
  end
end
