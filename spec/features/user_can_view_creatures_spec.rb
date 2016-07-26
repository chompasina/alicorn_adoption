require 'rails_helper'

RSpec.feature "Visitor sees the home page of the application" do
  scenario "they see all the creatures" do
    type = Type.create(name: "Land")
    creature_1 = type.creatures.create(name: "Unicorn", price: 200.00)
    creature_2 = type.creatures.create(name: "Centaur", price: 150.00)

    visit root_path

    expect(page).to have_content("Welcome to Alicorn Adoption!")
    expect(page).to have_content("Unicorn")
    expect(page).to have_content("Centaur")
  end
  
  scenario "they can click on one creature" do 
    type = Type.create(name: "Land")
    creature_1 = type.creatures.create(name: "Unicorn", price: 200.00)

    visit root_path
    click_on "Unicorn"
    
    expect(page).to have_content creature_1.name
    expect(page).to have_content "Sponsor a unicorn"
  end
end