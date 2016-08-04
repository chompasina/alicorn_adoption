require 'rails_helper'

RSpec.feature "Registered user " do
  scenario "they cannot see user's private page" do
    user = User.create!(username: "Mozzie", password: "password1", email: "mozzie@gmail.com")
    
    visit dashboard_path
    
    expect(page).to have_content("Access Forbidden (403)")
    expect(page).to_not have_content("Mozzie")
    expect(page).to_not have_content("mozzie@gmail.com")
    
    visit cart_path
    click_button "Login to Checkout"
    expect(current_path).to eq("/login")
  end
  
  scenario "they cannot view the admin dashboard" do
  #this is being duplicated in the admin dashboard test.  
    visit '/admin/dashboard'
    
    expect(page.status_code).to eq(404)
    expect(page).to have_content("Mythical creatures exist, but sadly this page does not.")
    
    expect(page).to_not have_content("Admin Dashboard")
  end
end

