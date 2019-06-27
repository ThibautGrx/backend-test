class DrivyTest
  def resolve
    load_input
    generate_output
  end

  private

  def load_input
    data = JSON.parse(File.read('./data/input.json'), symbolize_names: true)
    data[:cars].map { |car| Car.new(car) }
    data[:rentals].map { |rental| Rental.new(rental) }
  end

  def generate_output
    File.open('data/output.json', 'w') do |f|
      f.write(JSON.pretty_generate(Rental.all_formatted), "\n")
    end
  end
end
