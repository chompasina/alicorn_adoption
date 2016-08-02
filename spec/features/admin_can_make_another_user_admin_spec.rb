require "rails_helper"
require "support/test_helper"

RSpec.feature "Admin user can create another admin" do
  context "username is valid" do
    scenario "they assign username as an admin" do
      new_admin = User.create!(
        username: "user",
        password: "password",
        email: "user@alicornadoption.com"
      )
      admin_login
      
      click_link "Create Another Admin"
      
      fill_in "Username", with: new_admin.username
      click_button "Create Admin"
      
      expect(page).to have_content("#{new_admin.username} is now an admin")
    end
  end
  
  context "username is invalid" do
    scenario "they can't assign username as admin" do
      admin_login
      
      click_link "Create Another Admin"
      
      fill_in "Username", with: "nonexistent_user"
      click_button "Create Admin"
      
      expect(page).to have_content("nonexistent_user was not found")
    end
  end
end