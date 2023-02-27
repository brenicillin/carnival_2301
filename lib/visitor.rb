class Visitor
  attr_reader :name,
              :height,
              :preferences
  attr_accessor :spending_money,
                :money_spent,
                :rides_ridden

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = format_money(spending_money)
    @preferences = []
    @money_spent = 0
    @rides_ridden = Hash.new(0)
  end

  def format_money(money_string)
    money_string.gsub(/\D/,'').to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(requirement)
    self.height >= requirement
  end

  def favorite_ride
    rides_ridden.max_by { |_, v| v }[0]
  end
end
