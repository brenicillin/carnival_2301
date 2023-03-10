require 'rspec'
require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  describe '#initialize' do
    it 'exists' do 
      ride1 = Ride.new({
        name: 'Carousel',
        min_height: 24,
        admission_fee: 1,
        excitement: :gentle
       })

      expect(ride1).to be_a(Ride)
    end

    it 'has attributes' do
      ride1 = Ride.new({
        name: 'Carousel',
        min_height: 24,
        admission_fee: 1,
        excitement: :gentle
      })

      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
    end
  end

  describe '#board_rider' do
    it 'can log riders' do
      ride1 = Ride.new({
        name: 'Carousel',
        min_height: 24,
        admission_fee: 1,
        excitement: :gentle
       })
       visitor1 = Visitor.new('Bruce', 54, '$10')
       visitor2 = Visitor.new('Tucker', 36, '$5')
       visitor1.add_preference(:gentle)
       visitor2.add_preference(:gentle)
       ride1.board_rider(visitor1)
       ride1.board_rider(visitor2)
       ride1.board_rider(visitor1)

       expect(ride1.rider_log).to eq({visitor1=>2, visitor2=>1})
    end

    it 'can track spending money and revenue' do
      ride1 = Ride.new({
        name: 'Carousel',
        min_height: 24,
        admission_fee: 1,
        excitement: :gentle
       })
       visitor1 = Visitor.new('Bruce', 54, '$10')
       visitor2 = Visitor.new('Tucker', 36, '$5')
       visitor1.add_preference(:gentle)
       visitor2.add_preference(:gentle)
       ride1.board_rider(visitor1)
       ride1.board_rider(visitor2)
       ride1.board_rider(visitor1)

       expect(visitor1.spending_money).to eq(8)
       expect(visitor2.spending_money).to eq(4)
       expect(ride1.total_revenue).to eq(3)
    end

    it 'will return false if visitor cant afford ride' do
      visitor1 = Visitor.new('Bruce', 54, "$2")
      ride1 = Ride.new({
        name: 'Roller Coaster',
        min_height: 54,
        admission_fee: 2,
        excitement: :thrilling
        })

      expect(ride1.board_rider(visitor1)).to eq(0) #(remaining spending money)
      expect(ride1.board_rider(visitor1)).to eq(false)
    end
  end

  describe '#eligibility checks' do
    it 'can deny if height too low' do
      ride3 = Ride.new({
        name: 'Roller Coaster',
        min_height: 54,
        admission_fee: 2,
        excitement: :thrilling
        })
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        ride3.board_rider(visitor1)
        ride3.board_rider(visitor2)

        expect(ride3.rider_log).to eq({visitor1=>1})
        expect(ride3.total_revenue).to eq(2)
        expect(visitor1.spending_money).to eq(8)
        expect(visitor2.spending_money).to eq(5)
    end
  end
end