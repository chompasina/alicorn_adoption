require 'rails_helper'

RSpec.feature "Admin can login" do
  scenario "Admin can see admin privileges" do 
    creature = FactoryGirl.create(:creature)
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
    
    expect(admin.admin).to eq(true)
    expect(page).to have_content("Logged in as admin")
    expect(current_path).to eq('/admin/dashboard')  
  end
end