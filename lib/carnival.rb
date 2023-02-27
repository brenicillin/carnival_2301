class Carnival
  attr_reader :duration,
              :rides
              
  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride_hash)
    @rides << Ride.new(ride_hash)
  end

  def most_popular
    @rides.max_by { |ride| ride.rider_log.values }
  end

  def total_revenue
    revenue = []
    @rides.each do |ride|
      revenue << ride.total_revenue
    end
    revenue.sum
  end

  def most_profitable
   @rides.max_by { |ride| ride.total_revenue }
  end
end
