class Option
  attr_reader :rental_id, :type

  @@all = []

  def initialize(**attributes)
    @id = attributes[:id]
    @rental_id = attributes[:rental_id]
    @type = attributes[:type]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_associated(id)
    @@all.select { |option| option.rental_id == id }
  end
end
