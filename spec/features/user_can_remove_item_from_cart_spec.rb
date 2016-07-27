require "rails_helper"

RSpec.feature "User wants to remove item from cart" do
  scenario "and there is a single item in the cart" do
    type = FactoryGirl.create(:type)
    creature = FactoryGirl.create(:creature, type_id: type.id)
    
    visit root_path
    click_button "Sponsor me"
    visit cart_path
    
    click_link "Remove"
    
    expect(page).to have_content("Successfully removed #{creature.name} from your cart")
    expect(page).to have_link(creature.name, creature_path(creature))
    expect(page).to have_content("Total: $0.00")
  end
end