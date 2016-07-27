require 'rails_helper'

RSpec.feature "Visitor adds items to cart" do
  scenario "without logging in, they can view items in cart" do
    creature = Creature.create(
      name: "Hippogriff",
      price: "500.00"
      )

      visit root_path
      expect(page).to have_content("Cart: 0")

      click_button "Sponsor me"

      expect(page).to have_content("You now have sponsored 1 Hippogriff")
      expect(page).to have_content("Cart: 1")

      click_button "Sponsor me"

      expect(page).to have_content("You now have sponsored 2 Hippogriffs")
      expect(page).to have_content("Cart: 2")
      
      click_on "Cart: 2"
      expect(current_path).to eq(carts_path)
      
      expect(page).to have_content()
      expect(page).to have_css(:img)
      expect(page).to have_content(creature.name)
      expect(page).to have_content(creature.price)
      
      checkout = Order.last
      expect(Order.count).to eq(1)
      expect(order.user_name).to eq("Tommasina")
      expect(order.checkout_creatures.first.quantity).to eq(2)
  end
end