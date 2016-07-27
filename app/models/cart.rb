class Cart
  attr_reader :contents
  
  def initialize(contents)
    @contents = contents ||= {}
  end
  
  def add_creature(creature_id)
    contents[creature_id.to_s] ||= 0
    contents[creature_id.to_s] += 1
  end
  
  def count_of(creature_id)
    contents[creature_id.to_s]
  end
  
  def total
    contents.values.sum
  end
  
  def creatures
    creatures = []
    contents.keys.each do |id|
      creatures << Creature.find(id)
    end
    creatures
  end
end