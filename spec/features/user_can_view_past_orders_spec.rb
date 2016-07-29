require 'rails_helper'

RSpec.feature "Authenticated user can view past orders" do
  before(:all) do
    land_type = Type.create!(name: "terrestrial")
    creature_1 = land_type.creatures.create!(name: "Unicorn", price: 200.00)
    creature_2 = type.creatures.create!(name: "Centaur", price: 150.00)
  end
  context "User has multiple previous orders" do
    scenario "they see their page with their order history" do
      
      user1 = User.create!(username: "Casey", password: "password", email: "casey@gmail.com")
      
      user1_order1 = user1.Order.new
      order1_items = user1_order1.order_items.create!(creature: creature_1.id, quantity: 2)
    
      user1_order2 = user2.Order.new 
      order1_items = user1_order2.order_items.create!(creature: creature_1.id, quantity: 1)
      
      user2 = User.create!(username: "Mozzie", password: "password1", email: "mozzie@gmail.com")
      
      user2_order1 = user2.Order.new
      order1_items = user1_order1.order_items.create!(creature: creature_2.id, quantity: 1)
      
      click_on "Login"
      fill_in "session_username", with: "Casey"
      fill_in "session_password", with: "password"
      click_button "Login"
      
      visit '/orders'
      
      expect(page).to have_content(user1_order1.id)
      expect(page).to have_content(user1_order2.id)
      expect(page).to_not have_content(user2_order1.id)
    end
  end
end