def create_factory_creature
  type = FactoryGirl.create(:type)
  creature = FactoryGirl.create(:creature, type_id: type.id)
end

def create_creature
  type = Type.create(name: "Land")
  type.creatures.create(name: "Unicorn", description: "Pretty and pink", price: 200.00)
end

def admin_login
  admin = User.create!(
    username: "admin", 
    password: "adminpw", 
    email: "admin@gmail.com", 
    admin: true
    )

  visit root_path
  click_on "Login"
  fill_in "session_username", with: "admin"
  fill_in "session_password", with: "adminpw"
  click_button "Login"
end