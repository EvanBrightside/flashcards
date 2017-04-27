require 'rails_helper'

RSpec.feature 'Card checking', type: :feature do
  describe 'Checking a card' do

  	let!(:card) { FactoryGirl.create(:card) }

  	before(:each) do
    	visit root_path
  	end

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
end
