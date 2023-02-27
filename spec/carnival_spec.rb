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

  describe '#add_ride' do
    it 'can add fully defined rides' do
      carnival = Carnival.new(7)
      carnival.add_ride({
        name: 'Roller Coaster',
        min_height: 54,
        admission_fee: 2,
        excitement: :thrilling
        })
      carnival.add_ride({
        name: 'Carousel',
        min_height: 24,
        admission_fee: 1,
        excitement: :gentle
       })

        expect(carnival.rides).to all(be_a(Ride))
    end
  end
end