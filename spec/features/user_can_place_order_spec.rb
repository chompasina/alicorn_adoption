require 'rails_helper'

# Background: An existing user and a cart with items
# As a visitor
# When I add items to my cart
# And I visit "/cart"
# And I click "Login or Register to Checkout"
# Then I should be required to login
# When I am logged in I should be taken back to my cart
# And when I click "Checkout"
# Then the order should be placed
# And my current page should be "/orders"
# And I should see a message "Order was successfully placed"
# And I should see the order I just placed in a table

RSpec.feature "Existing user has items in cart" do
  scenario "they can place an order" do
    creature = FactoryGirl.create(:creature)
    user = User.create!(
      username: "Casey", 
      password: "password", 
      email: "casey@gmail.com"
    )
    
    visit root_path
    click_button "Sponsor me"
    visit '/cart'
    click_on "Login to Checkout"
  
    expect(current_path).to eq(login_path)
    
    fill_in "session_username", with: "Casey"
    fill_in "session_password", with: "password"
    click_button "Login"
    
    expect(current_path).to eq('/cart')
  
    click_button "Checkout"
    
    expect(current_path).to eq(order_path)
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Your Order:")
    expect(page).to have_content("Sponsorships:") #{creature.name}
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Total Price:")
  end
end