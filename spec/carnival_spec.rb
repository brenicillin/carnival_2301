require 'rspec'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  describe '#initialize' do
    it 'exists' do
      carnival = Carnival.new(7)

      expect(carnival).to be_a(Carnival)
    end

    it 'has attributes' do
      carnival = Carnival.new(7)

      expect(carnival.duration).to eq(7)
      expect(carnival.rides).to eq ([])
    end
  end
end