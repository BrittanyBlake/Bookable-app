require 'rails_helper'
RSpec.describe 'authentication', type: :feature do
  let(:user) { FactoryBot.build(:user) }

  feature 'Sign up' do
    scenario 'Sign Up with valid params' do
      visit root_path
      find('#submit').click
      fill_in 'Username', with: user.username
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      find('#submit').click
      expect(page).to have_content(user.username)
    end

    scenario 'Sign Up with invalid username' do
      visit root_path
      find('#submit').click
      fill_in 'Username', with: ' '
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      find('#submit').click
      expect(page).to have_content("Username can't be blank")
    end

    scenario 'Sign Up with invalid email' do
      visit root_path
      find('#submit').click
      fill_in 'Username', with: user.username
      fill_in 'Email', with: ' '
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      find('#submit').click
      expect(page).to have_content("Email can't be blank")
    end

    scenario 'Sign Up with invalid password' do
      visit root_path
      find('#submit').click
      fill_in 'Username', with: user.username
      fill_in 'Email', with: user.email
      fill_in 'Password', with: ' '
      fill_in 'Password confirmation', with: 'foobar'
      find('#submit').click
      expect(page).to have_content("Password can't be blank")
    end
  end

  feature 'Sign In' do

    scenario 'Sign Up with valid params' do
      visit root_path
      find('#login').click
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#login').click
      expect(page).to have_content("Invalid Email or password")
    end
    

    scenario 'Sign Up with invalid email' do
      visit root_path
      find('#login').click
      fill_in 'Email', with: ' '
      fill_in 'Password', with: 'foobar'
      find('#login').click
      expect(page).to have_content("Invalid Email or password")
    end

    scenario 'Sign Up with invalid password' do
      visit root_path
      find('#login').click
      fill_in 'Email', with: user.email
      fill_in 'Password', with: ' '
      find('#login').click
      expect(page).to have_content("Invalid Email or password")
    end
  end



end