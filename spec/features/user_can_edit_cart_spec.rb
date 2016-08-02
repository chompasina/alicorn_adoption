require "rails_helper"

RSpec.feature "User wants to change the quantity of a creature from cart" do
  scenario "user wants to add another creature" do
    type = FactoryGirl.create(:type)
    creature = FactoryGirl.create(:creature, type_id: type.id)
    
    visit root_path
    click_button "Sponsor me"
    visit cart_path
    
    expect(page).to have_content(creature.price)
    expect(page).to have_content("1")
    
    click_button "+"
    
    expect(page).to have_content(creature.price * 2)
    expect(page).to have_content("2")
  end
  
  scenario "user has an extra creature they want to remove " do
    type = FactoryGirl.create(:type)
    creature = FactoryGirl.create(:creature, type_id: type.id)
    
    visit root_path
    click_button "Sponsor me"
    visit cart_path
    
    click_button "+"
    
    expect(page).to have_content(creature.price*2)
    expect(page).to have_content("2")
    
    click_button "-"
    
    expect(page).to have_content(creature.price)
    expect(page).to have_content("1")
  end
end