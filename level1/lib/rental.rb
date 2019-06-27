class Rental
  attr_reader :id, :car, :start_date, :end_date, :distance

  @@all = []

  def initialize(**attributes)
    @id = attributes[:id]
    @car = Car.find(attributes[:car_id])
    @start_date = attributes[:start_date]
    @end_date  = attributes[:end_date]
    @distance  = attributes[:distance]
    @@all << self
  end

  def self.all
    @@all
  end

  def price
    duration * car.price_per_day + distance * car.price_per_km
  end

  def self.all_formatted
    { "rentals": all.map(&:to_h) }
  end

  def to_h
    { "id": id, "price": price }
  end

  private

  def duration
    (Date.parse(end_date) - Date.parse(start_date)).to_i + 1
  end
end
