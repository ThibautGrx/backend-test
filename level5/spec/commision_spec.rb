Dir['./*.rb'].each { |file| require file }

RSpec.describe Commission do
  let!(:car) { Car.new({ "id": 1, "price_per_day": 2000, "price_per_km": 10 }.to_h) }
  let(:commission) { Commission.new(rental.price, rental.duration, rental.options.map(&:type)) }
  let!(:rental) { Rental.new(rental_hash.to_h) }
  let(:rental_hash) { { "id": 1, "car_id": 1, "start_date": '2015-12-8', "end_date": '2015-12-8', "distance": 100 } }

  describe '#to_h' do
    context 'with rental 1' do
      let(:rental_hash) { { "id": 1, "car_id": 1, "start_date": '2015-12-8', "end_date": '2015-12-8', "distance": 100 } }
      it 'return hash with right fee values' do
        expect(commission.to_h).to eq({ "insurance_fee": 450, "assistance_fee": 100, "drivy_fee": 350 }.to_h)
      end
    end

    context 'with rental 2' do
      let(:rental_hash) { { "id": 2, "car_id": 1, "start_date": '2015-03-31', "end_date": '2015-04-01', "distance": 300 } }
      it 'return hash with right fee values' do
        expect(commission.to_h).to eq({ "insurance_fee": 1020, "assistance_fee": 200, "drivy_fee": 2820 }.to_h)
      end
    end

    context 'with rental 3' do
      let(:rental_hash) { { "id": 3, "car_id": 1, "start_date": '2015-07-3', "end_date": '2015-07-14', "distance": 1000 } }
      it 'return hash with right fee values' do
        expect(commission.to_h).to eq({ "insurance_fee": 4170, "assistance_fee": 1200, "drivy_fee": 2970 }.to_h)
      end
    end
  end

  describe '#fee' do
    it 'calculate the right fee' do
      expect(commission.fee).to eq(900)
    end
  end

  describe '#insurance_fee' do
    it 'calculate the right insurance_fee' do
      expect(commission.insurance_fee).to eq(450)
    end
  end

  describe '#assistance_fee' do
    it 'calculate the right assistance_fee' do
      expect(commission.assistance_fee).to eq(100)
    end
  end

  describe '#drivy_fee' do
    it 'calculate the right drivy_fee' do
      expect(commission.drivy_fee).to eq(350)
    end
  end

  describe '#price_with_options' do
    it 'calculate the right price_with_options' do
      expect(commission.price_with_options).to eq(3700)
    end
  end

  describe '#insurance_option_price' do
    it 'calculate the right insurance_option_price' do
      expect(commission.insurance_option_price.to_i).to eq(0)
    end
  end
end
