require 'rails_helper'

RSpec.feature "Visitor views type page" do
  scenario "they see all creatures in that type" do
  type = Type.create(name: "Land")
  creature_1 = type.creatures.create(name: "Unicorn", price: 200.00)
  creature_2 = type.creatures.create(name: "Centaur", price: 150.00)
  
  visit root_path
  expect(page).to have_link type.name, href: type_path(type)
  
  click_on "Land Creatures" 
  expect(page).to have_content("Unicorn")
  expect(page).to have_content("Centaur")
  end

context "Visitor wants to see another type of creature" do
  scenario "they can click within a type page to see another type" do
    land_type = Type.create(name: "Land")
    creature_1 = land_type.creatures.create(name: "Unicorn", price: 200.00)
    sea_type = Type.create(name: "Sea")
    creature_2 = sea_type.creatures.create(name: "Loch Ness Monster", price: 500.00)
    
    visit root_path
    click_on "Land Creatures"
    
    expect(page).to have_link sea_type.name, href: type_path(sea_type)
    
    click_on "Sea Creatures"

    expect(page).to have_content("Loch Ness Monster")
  end
end
  
  
  
