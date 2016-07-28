require 'rails_helper'

RSpec.feature "Admin is logged in and wants to modify account data" do
  admin_attributes = {
    username: "admin",
    password: "password",
    email: "admin@alicorn.com",
    admin: true
  }
  
  admin = User.create!(admin_attributes)
  user = FactoryGirl.create(:user)
  
  scenario "and the admin can login and modify their own account data" do
    visit login_path
    fill_in "session_username", with: admin_attributes[:username]
    fill_in "session_password", with: admin_attributes[:password]
    click_button "Login"
    click_link "Edit my information"
    fill_in "email", with: "new_admin@alicorn.com"
    
    click_button "Submit"
    
    expect(current_path).to eq(user_path(admin))
    expect(page).to have_content("admin")
    expect(page).to have_content("new_admin@alicorn.com")
  end
  
  scenario "and the admin cannot modify other user account data" do
    visit user_path(user)
    
    expect(page).to_not have_content("Edit my information")
  end
end  