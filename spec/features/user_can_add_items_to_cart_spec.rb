require 'rails_helper'
#
# As a visitor
# When I visit any page with an item on it
# I should see a link or button for "Add to Cart"
# When I click "Add to cart" for that item
# And I click a link or button to view cart
# And my current path should be "/cart"
# And I should see a small image, title, description and price for the item I just added
# And there should be a "total" price for the cart that should be the sum of all items in the cart

RSpec.feature "Visitor can add an item to cart" do
   scenario "when on the homepage, visitor clicks to add an item to cart" do 
    creature = FactoryGirl.create(:creature)

      visit root_path
      expect(page).to have_link("Cart: 0")

      click_button "Sponsor me"

      expect(page).to have_link("Cart: 1")
      expect(page).to have_content("You now have sponsored 1 #{creature.name}")
      
      click_link "Cart: 1"
      
      expect(current_path).to eq(carts_path)
      expect(page).to have_content(creature.name)
      expect(page).to have_content(creature.price)
      # expect(page).to have_content(creature.description)
      expect(page).to have_css(:img)
      # expect(page).to have_content(order.total)
    end
  end
      
  # scenario "when they are on the homepage, they can click to add an item to their cart" do 

  #     click_button "Sponsor me"
  # 
  #     expect(page).to have_content("You now have 2 sponsored Hippogriffs")
  #     expect(page).to have_content("Cart: 2")
  # end
