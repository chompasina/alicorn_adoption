require 'rails_helper'

RSpec.feature "Only admin can access admin dashboard page" do
  context "admin logs in and accesses the admin dashboard" do
    scenario "they see the admin dashboard " do
      admin_login
      
      visit "/admin/dashboard"
      
      within(:css, 'h1') do
        expect(page).to have_content("Admin Dashboard")
      end
    end
  end
  
  context "registered user tries to access the admin dashboard" do
    scenario "they get a 404 error" do
      user = User.create!(
        username: "Mozzie",
        password: "password1",
        email: "mozzie@gmail.com"
      )
      
      visit login_path
      
      fill_in "session_username", with: "Mozzie"
      fill_in "session_password", with: "password1"
      click_button "Login"
      
      visit "/admin/dashboard"

      expect(page.status_code).to eq(404)
      expect(page).to have_content(
        "Mythical creatures exist, but sadly this page does not."
      )
    end
  end
  
  context "unregistered user tries to access the admin dashboard" do
    scenario "they get a 404 error" do
      
      visit "/admin/dashboard"

      expect(page.status_code).to eq(404)
      expect(page).to have_content(
        "Mythical creatures exist, but sadly this page does not."
      )
    end
  end
end
