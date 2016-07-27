require 'rails_helper'

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
