require 'rails_helper'

RSpec.feature "Visitor sees the home page of the application" do
  scenario "they see all the creatures" do
    type = Type.create(name: "Land")
    creature_1 = type.creatures.create(name: "Unicorn", price: 200.00)
    creature_2 = type.creatures.create(name: "Centaur", price: 150.00)

    visit root_path

    expect(page).to have_content("Alicorn Adoption")
    expect(page).to have_content("All Creatures")
    expect(page).to have_content("Unicorn")
    expect(page).to have_content("Centaur")
  end
  
  scenario "they can click on one creature" do 
    type = Type.create(name: "Land")
    creature_1 = type.creatures.create(name: "Unicorn", price: 200.00)

    visit root_path
    click_on "Unicorn"

    expect(page).to have_content("Unicorn")
    page.should have_button("Sponsor me for $200.00!")
    expect(current_path).to eq("/creatures/20")
  end
end