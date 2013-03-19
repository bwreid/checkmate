require 'spec_helper'
require 'factory_girl'

describe 'Session Controller' do
  describe 'GET /login' do
    it 'should show a login button on the home page in the main navigation' do
      visit root_path
      page.should have_link('Login')
    end

    it 'should see the login form after clicking the login button', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Submit')
    end

    it 'should cancel the form when cancel is pressed', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Submit')
      click_link('Cancel')
      page.should_not have_select('a[data-clear-form]', visible: false)
    end

    it 'should allow the user to login with the correct credentials', :js => true do
      user = FactoryGirl.create(:user)
      visit root_path
      click_link('Login')
      fill_in 'username', with: user.username
      fill_in 'password', with: 'x'
      click_button('Submit')
      page.should have_link(user.username)
      page.should have_link('Logout')
    end

    it 'SHOULD NOT allow the user to login with incorrect credentials', :js => true do
      user = FactoryGirl.create(:user)
      visit root_path
      click_link('Login')
      fill_in 'username', with: user.username
      fill_in 'password', with: 'y'
      click_button('Submit')
      page.should have_button('Submit')
      page.should_not have_link(user.username)
    end
  end
end