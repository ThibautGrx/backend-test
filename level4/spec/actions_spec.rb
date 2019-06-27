Dir['./*.rb'].each { |file| require file }

RSpec.describe Actions do
  let!(:commission) { Commission.new(1000, 10) }

  describe '#all' do
    it 'returns the 5 created actions' do
      expect(Actions.new(commission).all.count).to eq(5)
    end
  end
end
