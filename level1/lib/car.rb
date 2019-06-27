class Car
  attr_reader :id, :price_per_day, :price_per_km

  @@all = []

  def initialize(**attributes)
    @id = attributes[:id]
    @price_per_day = attributes[:price_per_day]
    @price_per_km = attributes[:price_per_km]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all.select { |car| car.id == id }.first
  end
end
