require 'rails_helper'

RSpec.feature "Authenticated user cannot see admin privileges" do
  context "user is authenticated" do
    scenario "user cannot see other user or admin pages" do 
      land_type = Type.create!(name: "terrestrial")
      creature_1 = land_type.creatures.create!(name: "Unicorn", price: 200.00)
      creature_2 = land_type.creatures.create!(name: "Centaur", price: 150.00)
      
      user1 = User.create!(
        username: "Casey", 
        password: "password", 
        email: "casey@gmail.com"
      )
      
      user1_order1 = user1.orders.create
      order1_items = user1_order1.creatures_orders.create!(
        creature_id: creature_1.id, 
        quantity: 2
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
      
      expect(user1.admin).to eq(false)
      expect(user2.admin).to eq(false)
      expect(page).to_not have_content("Logged in as admin")
      expect(page).to_not have_content("Logged in as Mozzie")
      expect(page).to have_content("Logged in as Casey")
      
      visit orders_path
      expect(page).to have_content("Casey's Order History")
      expect(page).to have_content("Order 6")
      expect(page).to_not have_content("Mozzie's Order History")
      
      visit admin_dashboard_index_path
      expect(page.status_code).to eq(404)
    end
  end
end