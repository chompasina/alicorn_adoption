require 'rails_helper'

RSpec.feature "Registered user " do
  scenario "they cannot see user's private page" do
    user = User.create!(username: "Mozzie", password: "password1", email: "mozzie@gmail.com")
    
    visit dashboard_path
    
    expect(page).to have_content("You need to login or create an account to see this page.")
    expect(page).to_not have_content(user.username)
    expect(page).to_not have_content(user.email)
    expect(current_path).to eq(login_path) #with a link to create an account in case that are not registered users
  end
  
  scenario "they cannot view the admin dashboard" do
    
    visit '/admin/dashboard'
    
    #maybe use errors.full_message? for this assertion?
    expect(page).to have_content("The page you were looking for doesn't exist.")
    
    expect(page).to_not have_content("Admin Dashboard")
    
    # I cannot make myself an administrator.    
  end
end

