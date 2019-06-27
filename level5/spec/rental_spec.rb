RSpec.describe Rental do
  before(:each) { Rental.class_variable_set :@@all, [] }

  let!(:car) { Car.new({ "id": 1, "price_per_day": 2000, "price_per_km": 10 }.to_h) }
  let(:rental) { Rental.new(rental_hash.to_h) }
  describe '#price' do
    context 'with rental 1' do
      let(:rental_hash) { { "id": 1, "car_id": 1, "start_date": '2015-12-8', "end_date": '2015-12-8', "distance": 100 } }
      it 'calculates the right price' do
        expect(rental.price).to eq(3000)
      end
    end

    context 'with rental 2' do
      let(:rental_hash) { { "id": 2, "car_id": 1, "start_date": '2015-03-31', "end_date": '2015-04-01', "distance": 300 } }
      it 'calculates the right price' do
        expect(rental.price).to eq(6800)
      end
    end

    context 'with rental 3' do
      let(:rental_hash) { { "id": 3, "car_id": 1, "start_date": '2015-07-3', "end_date": '2015-07-14', "distance": 1000 } }
      it 'calculates the right price' do
        expect(rental.price).to eq(27_800)
      end
    end
  end
end
