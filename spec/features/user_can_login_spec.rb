require 'rails_helper'
require 'support/test_helper'

RSpec.feature "User needs to login to checkout" do
  context "at checkout, guest is prompted to login or create account" do
    scenario "user logs in" do 
      creature = FactoryGirl.create(:creature)
      user_login
      
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Logged in as Casey")
      expect(page).to have_content("casey@gmail.com")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end
  
  context "at checkout, guest is prompted to login or create account" do
    scenario "user cannot login with incorrect information" do 
      creature = FactoryGirl.create(:creature)
      user = User.create!(username: "Casey", password: "password", email: "casey@gmail.com")
      
      visit root_path
      click_button "Sponsor me"
      click_on "Cart: 1"
      click_link "Login"
      
      expect(current_path).to eq("/login")
      
      fill_in "session_username", with: "Casey"
      fill_in "session_password", with: "password2"
      click_button "Login"
  
      expect(page).to have_content("Invalid Login")
    end
  end
end