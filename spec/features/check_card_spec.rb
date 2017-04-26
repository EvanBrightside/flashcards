require "rails_helper"

RSpec.feature "Card checking", type: :feature do
  describe 'Checking a card' do

    it "shows flash message after correct checking" do
      @card = FactoryGirl.create(:card)
      visit root_path
      fill_in 'Enter the translation', with: 'Hello'
      click_button 'Check it!'
      expect(page).to have_content 'Yep!'
    end
  end
end
