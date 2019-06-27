Dir['./*.rb'].each { |file| require file }

RSpec.describe Action do
  describe '#to_h' do
    it 'return hash with right fee values' do
      expect(Action.new('owner', 'credit', 1000).to_h).to eq({ "who": 'owner', "type": 'credit', "amount": 1000 }.to_h)
    end
  end
end
