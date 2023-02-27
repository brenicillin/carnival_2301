class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement
  attr_accessor :total_revenue,
                :rider_log

  def initialize(ride_hash)
    @name = ride_hash[:name]
    @min_height = ride_hash[:min_height]
    @admission_fee = ride_hash[:admission_fee]
    @excitement = ride_hash[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    if verify_height(visitor)
      @rider_log[visitor] += 1
      visitor.spending_money -= @admission_fee
      @total_revenue += @admission_fee
    end
  end

  def verify_height(visitor)
    visitor.height >= @min_height
  end
end