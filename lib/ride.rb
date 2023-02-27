class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement
  attr_accessor :total_revenue

  def initialize(ride_hash)
    @name = ride_hash[:name]
    @min_height = ride_hash[:min_height]
    @admission_fee = ride_hash[:admission_fee]
    @excitement = ride_hash[:excitement]
    @total_revenue = 0
  end
end
