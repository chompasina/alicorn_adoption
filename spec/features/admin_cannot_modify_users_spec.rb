require 'rails_helper'

RSpec.feature "Admin is logged in and wants to modify account data" do
  scenario "and the admin can login and modify their own account data" do
    admin = User.create!(
                        username: "admin",
                        password: "password",
                        email: "admin@alicorn.com",
                        admin: true 
                        )
    
    visit login_path
    fill_in "session_username", with: admin.username
    fill_in "session_password", with: "password"
    click_button "Login"
    
    click_link "Edit my information"
    fill_in "Email", with: "new_admin@alicorn.com"
    fill_in "Password", with: "password"
     
    click_button "Update"
    
    expect(current_path).to eq(admin_dashboard_index_path)
    # save_and_open_page
    expect(page).to have_content("admin")
    expect(page).to have_content("new_admin@alicorn.com")
  end
  
  xscenario "and the admin cannot modify other user account data" do
    visit dashboard_path(user)
    
    expect(page).to_not have_content("Edit my information")
  end
end
