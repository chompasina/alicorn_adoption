require 'rails_helper'

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
      
    expect(current_path).to eq(orders_path)
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Order 1 Summary")
    within('.table') do
      expect(page).to have_content(creature.name)
      expect(page).to have_content(creature.price)
      expect(page).to have_content(user.orders.first.total_price)
    end
  end
end