require 'rails_helper'

RSpec.feature "Authenticated user can view past orders" do
  context "User has multiple previous orders" do
    scenario "they see their page with their order history" do 
      land_type = Type.create!(name: "terrestrial")
      creature_1 = land_type.creatures.create!(name: "Unicorn", price: 200.00)
      creature_2 = land_type.creatures.create!(name: "Centaur", price: 150.00)
      
      user1 = User.create!(username: "Casey", password: "password", email: "casey@gmail.com")
      
      user1_order1 = user1.orders.create
      order1_items = user1_order1.creatures_orders.create!(
        creature_id: creature_1.id, 
        quantity: 2
      )
    
      user1_order2 = user1.orders.create
      order1_items = user1_order2.creatures_orders.create!(
        creature_id: creature_1.id, 
        quantity: 1
      )
      
      user2 = User.create!(
        username: "Mozzie", 
        password: "password1", 
        email: "mozzie@gmail.com"
      )
      
      user2_order1 = user2.orders.create
      order1_items = user2_order1.creatures_orders.create!(
        creature_id: creature_2.id, 
        quantity: 1
      )
      
      visit root_path
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
    
  context "they click on a link to view a past order" do
    scenario "they see order details from their single order" do
      land_type = Type.create!(name: "aerial")
      creature_1 = land_type.creatures.create!(name: "Dragon", price: 200.00)
      
      user1 = User.create!(username: "Casey", password: "password", email: "casey@gmail.com")
      
      visit root_path
      click_on "Login"
      fill_in "session_username", with: "Casey"
      fill_in "session_password", with: "password"
      click_button "Login"
    
      user1_order1 = user1.orders.create
      order1_items = user1_order1.creatures_orders.create!(
        creature_id: creature_1.id, 
        quantity: 2
      )
      
      visit orders_path
      
      expect(page).to have_link("Order #{user1_order1.id}")
      
      click_link("Order #{user1_order1.id}")
      expect(page).to have_content("Dragon")
      expect(page).to have_content("2")
      expect(page).to have_content("$400.00")
      expect(page).to have_content(user1_order1.created_at.strftime("%A, %d %b %Y %l:%M %p"))
    end
  end
end
