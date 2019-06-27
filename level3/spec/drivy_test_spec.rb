require 'date'
require 'json'
Dir['./lib/*.rb'].each { |file| require file }

RSpec.describe DrivyTest do
  before(:each) { Rental.class_variable_set :@@all, [] }

  describe '.resolve' do
    it 'the right json file is generated' do
      subject.resolve
      expect(IO.read('./data/output.json')).to eq(IO.read('./data/expected_output.json'))
    end
  end
end
