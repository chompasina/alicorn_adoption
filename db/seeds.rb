class Seed
  def self.start
    new.generate
  end
  
  def generate
    create_types
    Type.all.each do |type|
      create_creatures(type)
    end
  end
  
  def create_types
    type_names.each do |name|
      Type.create(name: name)
    end
  end
  
  def create_creatures(type)
    creatures_of_type = creatures[type.name]
    creatures_of_type.each do |creature|
      type.creatures.create(name: creature[0], price: creature[1])
    end
  end
  
  def type_names
    ["Terrestrial", "Aquatic", "Aerial"]
  end
  
  def creatures
    { "Terrestrial" =>
      [["Basilisk", 350.00],
       ["Centaur", 200.00],
       ["Dwarf", 150.00],
       ["Elf", 175.00],
       ["Gnome", 175.00],
       ["Leprechaun", 125.00],
       ["Minotaur", 300.00],
       ["Unicorn", 800.00]
      ],
      "Aquatic" => [
        ["Mermaid", 400.00]
      ],
      "Aerial" =>
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