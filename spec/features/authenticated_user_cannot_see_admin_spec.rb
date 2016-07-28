# An authenticated user and the ability to add an admin user
# As an Authenticated User
# I cannot view another user's' private data (current or past orders, etc)
# I cannot view the administrator screens or use admin functionality
# I cannot make myself an admin

require 'rails_helper'

RSpec.feature "Authenticated user cannot see admin privileges" do
  context "user is authenticated" do
    scenario "user cannot see other user or admin pages" do 
      creature = FactoryGirl.create(:creature)
      authenticated_user = User.create!(
        username: "Casey", 
        password: "password", 
        email: "casey@gmail.com", 
        admin: false
      )
      other_user = User.create!(
        username: "Andrew", 
        password: "password", 
        email: "andrew@gmail.com", 
        admin: false
      )
      admin = User.create!(
        username: "admin", 
        password: "admin", 
        email: "admin@gmail.com", 
        admin: true
      )
      
      visit root_path
      click_on "Login"
      fill_in "session_username", with: "Casey"
      fill_in "session_password", with: "password"
      click_button "Login"
      
      expect(authenticated_user.admin).to eq(false)
      expect(page).to_not have_content("Logged in as admin")
      expect(page).to_not have_content("Logged in as Andrew")
      expect(page).to have_content("Logged in as Casey")
      expect(current_path).to_not eq('/admin/dashboard')
      
      visit root_path
      expect(page).to_not have_content("Add Creatures")
      expect(page).to_not have_content("Add Admin")
      
      click_button "Sponsor me"
      visit '/cart'
      click_button "Checkout"
      
      expect(page).to have_content("Casey's Past Orders")
      expect(page).to_not have_content("Andrew's Past Orders")
    end
  end
end