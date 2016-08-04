require 'rails_helper'

RSpec.feature "Guest user needs to register to checkout" do
  context "at checkout, they are prompted to login or create account" do
    scenario "guest creates an account" do 
      creature = FactoryGirl.create(:creature)

      visit root_path

      click_button "Sponsor me"
      click_on "Cart: 1"
      
      expect(page).to_not have_content("Checkout")
      expect(page).to have_content("Register")
      
      click_on "Register"
      fill_in "user_username", with: "Casey"
      fill_in "user_password", with: "password"
      fill_in "user_email", with: "casey@gmail.com"
      
      expect(current_path).to eq(new_user_path)
      click_on "Create Account"
      expect(current_path).to eq(dashboard_path(User.first))
      
      visit cart_path
      
      expect(page).to have_content(creature.name)
      expect(page).to have_content(creature.price)
      expect(page).to have_content(creature.description)
      expect(page).to have_css(:img)
      expect(page).to have_content("Total: $#{creature.price}")
      
      click_on "Logout"
      expect(page).to_not have_content("Logout")
      expect(page).to have_content("Successfully logged out")
      expect(current_path).to eq(root_path)
    end
  end
  
  context "at checkout, they are prompted to login or create account" do
    scenario "guest cannot create an account without all of the information" do 
      creature = FactoryGirl.create(:creature)

      visit root_path

      click_button "Sponsor me"
      click_on "Cart: 1"
      
      expect(page).to_not have_content("Checkout")
      expect(page).to have_content("Register")
      
      click_on "Register"
      expect(current_path).to eq(new_user_path)

      fill_in "user_username", with: "Casey"
      fill_in "user_password", with: "password"
      fill_in "user_email", with: nil
      
      click_on "Create Account"
      
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Invalid Information")
    end
  end
end