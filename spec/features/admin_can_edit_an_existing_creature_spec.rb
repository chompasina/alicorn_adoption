require 'rails_helper'
require 'support/test_helper'

# Then my current path should be "/admin/items/:ITEM_ID/edit"
# And I should be able to upate title, description, image, and status

RSpec.feature "Admin wants to edit an existing creature" do
  before do
    create_creature
    admin_login
  end
  
  scenario "Admin is logged in and edits the creature" do
    visit admin_creatures_path
    click_on "Edit Unicorn"
    
    expect(Creature.last.name).to eq("Unicorn")
    expect(Creature.last.price).to eq(200.00)
    expect(Creature.last.description).to eq("Pretty and pink")
    expect(Creature.last.retired).to eq(false)
    
    expect(current_path).to eq(edit_admin_creature_path(Creature.last))
    
    fill_in "creature_name", with: "NewUnicorn"
    fill_in "creature_price", with: "350.00"
    fill_in "creature_description", with: "Pretty and pink"
    fill_in "creature_retired", with: "true"
    
    click_button "Update"
    
    expect(Creature.last.name).to eq("NewUnicorn")
    expect(Creature.last.price).to eq(350.00)
    expect(Creature.last.description).to eq("Pretty and pink")
    expect(Creature.last.retired).to eq(true)
    
    # need to be able to edit image
  end
  
  scenario "User cannot edit an existing creature" do
    # need to write test for this
  end
end