require 'rails_helper'
require 'support/test_helper'

RSpec.feature "Admin wants to edit an existing creature" do
  before do
    create_creature
  end
  
  scenario "Admin is logged in and edits the creature" do
    admin_login
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
    fill_in "creature_image_path", with: "http://67.media.tumblr.com/30b1b0d0a42bca3759610242a1ff0348/tumblr_nnjxy1GQAA1tpo3v2o1_540.jpg"
    
    click_button "Update"
    
    expect(Creature.last.name).to eq("NewUnicorn")
    expect(Creature.last.price).to eq(350.00)
    expect(Creature.last.description).to eq("Pretty and pink")
    expect(Creature.last.retired).to eq(true)
    expect(Creature.last.image_path).to eq("http://67.media.tumblr.com/30b1b0d0a42bca3759610242a1ff0348/tumblr_nnjxy1GQAA1tpo3v2o1_540.jpg")

    expect(current_path).to eq(admin_creatures_path)
  end
  
  scenario "User cannot edit an existing creature" do
    user_login 
    visit admin_creatures_path
    
    expect(page.status_code).to eq(404)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end