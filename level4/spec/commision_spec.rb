Dir['./*.rb'].each { |file| require file }

RSpec.describe Commission do
  describe '#to_h' do
    let!(:car) { Car.new({ "id": 1, "price_per_day": 2000, "price_per_km": 10 }.to_h) }
    let!(:rental) { Rental.new(rental_hash.to_h) }
    let(:commission) { Commission.new(rental.price, rental.duration) }

    context 'with rental 1' do
      let(:rental_hash) { { "id": 1, "car_id": 1, "start_date": '2015-12-8', "end_date": '2015-12-8', "distance": 100 } }
      it 'return hash with right fee values' do
        expect(commission.to_h).to eq({ "insurance_fee": 450, "assistance_fee": 100, "drivy_fee": 350 }.to_h)
      end
    end

    context 'with rental 2' do
      let(:rental_hash) { { "id": 2, "car_id": 1, "start_date": '2015-03-31', "end_date": '2015-04-01', "distance": 300 } }
      it 'return hash with right fee values' do
        expect(commission.to_h).to eq({ "insurance_fee": 1020, "assistance_fee": 200, "drivy_fee": 820 }.to_h)
      end
    end

    context 'with rental 3' do
      let(:rental_hash) { { "id": 3, "car_id": 1, "start_date": '2015-07-3', "end_date": '2015-07-14', "distance": 1000 } }
      it 'return hash with right fee values' do
        expect(commission.to_h).to eq({ "insurance_fee": 4170, "assistance_fee": 1200, "drivy_fee": 2970 }.to_h)
      end
    end
  end
end
