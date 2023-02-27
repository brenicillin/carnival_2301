require 'rspec'
require './lib/visitor'

RSpec.describe Visitor do
  describe '#initialize' do
    it 'exists' do
      visitor = Visitor.new('Bruce', 54, '$10')

      expect(visitor).to be_a(Visitor)
    end
    
    it 'has attributes' do
      visitor = Visitor.new('Bruce', 54, "$10")

      expect(visitor.name).to eq('Bruce')
      expect(visitor.height).to eq(54)
      expect(visitor.spending_money).to eq(10)
      expect(visitor.preferences).to eq([])
    end
  end

  describe '#add_preferences' do
    it 'can add preferences to array'
    visitor1 = Visitor.new('Bruce', 54, '$10')
    
    expect(visitor.add_preference(:gentle)).to eq([:gentle])
    expect(visitor.add_preference(:water)).to eq([:gentle, :water])
  end
end