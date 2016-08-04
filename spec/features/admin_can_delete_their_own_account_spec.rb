require 'rails_helper'
require 'support/test_helper'

RSpec.feature "Admin wants to delete their own account" do
  scenario "They log in and delete their account" do
    admin = User.create!(
      username: "admin", 
      password: "adminpw", 
      email: "admin@gmail.com", 
      admin: true
    )
    
    visit root_path
    click_on "Login"
    fill_in "session_username", with: "admin"
    fill_in "session_password", with: "adminpw"
    click_button "Login"
    
    expect(current_path).to eq("/admin/dashboard")
    
    click_link("Delete My Account")
    
    expect(current_path).to eq("/")
    
    click_on "Login"
    fill_in "session_username", with: "admin"
    fill_in "session_password", with: "adminpw"
    click_button "Login"
    
    expect(page).to_not have_content("admin")
    expect(page).to have_content("Invalid Login")
  end
end