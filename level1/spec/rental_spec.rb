RSpec.describe Rental do
  before(:each) { Rental.class_variable_set :@@all, [] }

  before(:all) do
    data = JSON.parse(File.read('./data/input.json'), symbolize_names: true)
    data[:cars].map { |car| Car.new(car) }
  end

  let(:rental) { Rental.new(rental_hash.to_h) }
  describe '#price' do
    context 'with rental 1' do
      let(:rental_hash) { { "id": 1, "car_id": 1, "start_date": '2017-12-8', "end_date": '2017-12-10', "distance": 100 } }
      it 'calculate the right price' do
        expect(rental.price).to eq(7000)
      end
    end

    context 'with rental 2' do
      let(:rental_hash) { { "id": 2, "car_id": 1, "start_date": '2017-12-14', "end_date": '2017-12-18', "distance": 550 } }
      it 'calculate the right price' do
        expect(rental.price).to eq(15_500)
      end
    end

    context 'with rental 3' do
      let(:rental_hash) { { "id": 3, "car_id": 2, "start_date": '2017-12-8', "end_date": '2017-12-10', "distance": 150 } }
      it 'calculate the right price' do
        expect(rental.price).to eq(11_250)
      end
    end
  end

  describe '#all_formatted' do
    before do
      DrivyTest.new.resolve
    end
    it 'return the expected hash' do
      expected_result = { rentals: [{ id: 1, price: 7000 }, { id: 2, price: 15_500 }, { id: 3, price: 11_250 }] }
      expect(Rental.all_formatted).to eq(expected_result)
    end
  end
end
