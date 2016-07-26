require 'rails_helper'

RSpec.feature "Visitor can add items to cart" do
  Creature.create(
    name: "Hippogriff",
    price: "500.00"
    )

    visit root_path
    expect(page).to have_content("Cart: 0")

    click_button "Sponsor me"

    expect(page).to have_content("You now have 1 sponsored Hippogriff")
    expect(page).to have_content("Cart: 1")

    click_button "Sponsor me"

    expect(page).to have_content("You now have 2 sponsored Hippogriffs")
    expect(page).to have_content("Cart: 2")
  end
end

  