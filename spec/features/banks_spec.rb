require 'spec_helper'

describe 'Banks' do

  describe 'GET /' do
    it 'displays the New Bank link' do
      visit root_path
      page.should have_link('New Bank')
    end
  end
  describe 'GET /banks/new' do
    it 'displays the New Bank form', :js => true do
      visit root_path
      click_link('New Bank')
      page.should have_button('Create Bank')
    end
  end

  describe 'JS clear_form' do
    it 'clears the Bank form', :js => true do
      visit root_path
      click_link('New Bank')
      click_link('Cancel')
      page.should_not have_button('Create Bank')
    end
  end

  describe 'POST /banks' do
    it 'creates a Bank', :js => true do
      visit root_path
      click_link('New Bank')
      fill_in('Name', :with => 'Chase')
      click_button('Create Bank')
      page.should_not have_button('Create Bank')
      page.should have_link('Chase')
    end
  end
end

