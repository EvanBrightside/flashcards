require 'rails_helper'
require 'support/login_helper'

RSpec.feature 'User', type: :feature do
  describe "the signin process" do

    it 'signs me in' do
      visit sign_up_path

      fill_in 'Name', with: 'Evan'
      fill_in 'Email', with: 'hello@gmail.com'
      fill_in 'Password', with: 'user12345', :match => :prefer_exact
      fill_in 'Password confirmation', with: 'user12345', :match => :prefer_exact

      click_button 'Register'
      expect(page).to have_content 'All cards'
    end

    context 'log me in' do
      let!(:user) { FactoryGirl.create(:user) }

      before(:each) do
        visit log_in_path
      end

      it 'without any cards in base' do
        fill_in 'Email', with: 'hello@gmail.com'
        fill_in 'Password', with: 'user12345'

        click_button 'Log In'
        expect(page).to have_content 'All cards'
      end

      it 'with any cards in base' do
        FactoryGirl.create(:card, user_id: user[:id])

        fill_in 'Email', with: 'hello@gmail.com'
        fill_in 'Password', with: 'user12345'

        click_button 'Log In'
        expect(page).to have_content 'Welcome back!'
      end
    end

    it 'log me out' do
      FactoryGirl.create(:user)

      login("hello@gmail.com", "user12345")
      visit root_path

      click_link 'Log Out'
      expect(page).to have_content 'See you!'
    end
  end
end
