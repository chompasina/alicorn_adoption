require 'rails_helper'

RSpec.feature "User views a creature that has been retired" do
  scenario "and they see the creature page, but can't add it to the cart" do
    creature = FactoryGirl.create(:creature)
    creature.retire
    
    visit creature_path
    
    expect(page).to have_content(creature.name)
    expect(page).to have_content("This creature can no longer be sponsored")
    expect(page).to_not have_button("Sponsor me for $#{creature.price}!")
  end
end