require 'spec_helper'
require 'factory_girl'

describe 'Users Controller' do
  describe 'GET /users/new', :js => true do
    it 'should show a Create Account link' do
      visit root_path
      page.should have_link('Create Account')
    end

    it 'should show a registration form' do
      visit root_path
      click_link('Create Account')
      page.should have_button('Register')
    end

    it 'should cancel the form when cancel is clicked' do
      visit root_path
      click_link('Create Account')
      click_link('Cancel')
      page.should_not have_select('a[data-clear-form]', visible: false)
    end

    it 'should create a new user when information is valid', :js => true do
      visit root_path
      click_link('Create Account')
      fill_in 'user_username', with: 'x'
      fill_in 'user_password', with: 'x'
      fill_in 'user_password_confirmation', with: 'x'
      click_button('Register')
      page.should_not have_select('a[data-clear-form]', visible: false)
      User.first.username.should eq 'x'
    end

    it 'SHOULD NOT create a new user when information is invalid' do
      visit root_path
      click_link('Create Account')
      fill_in 'user_password', with: 'x'
      fill_in 'user_password_confirmation', with: 'x'
      click_button('Register')
      User.all.count.should be 0
    end
  end

end
