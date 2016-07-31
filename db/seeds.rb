class Seed
  def self.start
    new.generate
  end
  
  def generate
    create_types
    Type.all.each do |type|
      create_creatures(type)
    end
    create_admin
  end
  
  def create_admin
    User.create(username: "admin", password: "admin", email: "admin@admin.com", admin:true)
  end
  
  def create_types
    type_names.each do |name|
      Type.create(name: name)
    end
  end
  
  def create_creatures(type)
    creatures_of_type = creatures[type.name]
    creatures_of_type.each do |creature|
      type.creatures.create(
        name: creature[0], 
        price: creature[1],
        description: Faker::Lorem.paragraph
        )
    end
  end
  
  def type_names
    ["terrestrial", "aquatic", "aerial"]
  end
  
  def creatures
    { "terrestrial" =>
      [["Basilisk", 350.00],
       ["Centaur", 200.00],
       ["Dwarf", 150.00],
       ["Elf", 175.00],
       ["Gnome", 175.00],
       ["Leprechaun", 125.00],
       ["Minotaur", 300.00],
       ["Unicorn", 800.00]
      ],
      "aquatic" => [
        ["Mermaid", 400.00],
        ["Nessie", 950.00]
      ],
      "aerial" =>
      [["Alicorn", 650.00],
       ["Dragon", 1050.00],
       ["Fairy", 75.00],
       ["Pegasus", 600.00],
       ["Phoenix", 400.00],
       ["Pixie", 50.00]
      ]
    }
  end
end

Seed.start