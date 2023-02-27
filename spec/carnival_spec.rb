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

  describe '#most_popular' do
    it 'can return the most popular ride' do
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
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      carnival.rides[0].board_rider(visitor1)
      carnival.rides[0].board_rider(visitor2)
      carnival.rides[0].board_rider(visitor3)
      carnival.rides[1].board_rider(visitor1)
      carnival.rides[1].board_rider(visitor2)
      carnival.rides[1].board_rider(visitor3)
      
      expect(carnival.most_popular).to eq(carnival.rides[1])
    end
  end

  describe '#total_revenue' do
    it 'can return the total revenue from all rides' do
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
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      carnival.rides[0].board_rider(visitor1)
      carnival.rides[0].board_rider(visitor2)
      carnival.rides[0].board_rider(visitor3)
      carnival.rides[1].board_rider(visitor1)
      carnival.rides[1].board_rider(visitor2)
      carnival.rides[1].board_rider(visitor3)

      expect(carnival.total_revenue).to eq(7)
    end
  end

  describe '#most_profitable' do
    it 'can return the most profitable of all rides' do
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
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      carnival.rides[0].board_rider(visitor1)
      carnival.rides[0].board_rider(visitor2)
      carnival.rides[0].board_rider(visitor3)
      carnival.rides[1].board_rider(visitor1)
      carnival.rides[1].board_rider(visitor2)
      carnival.rides[1].board_rider(visitor3)

      expect(carnival.most_profitable).to eq(carnival.rides[0])
    end
  end

  describe '#info_hash' do
    it 'can provide a summary hash' do
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
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      carnival.rides[0].board_rider(visitor1)
      carnival.rides[0].board_rider(visitor2)
      carnival.rides[0].board_rider(visitor3)
      carnival.rides[1].board_rider(visitor1)
      carnival.rides[1].board_rider(visitor2)
      carnival.rides[1].board_rider(visitor3)
require 'pry'; binding.pry
      expect(carnival.info_hash).to be_a(Hash)
    end
  end
end