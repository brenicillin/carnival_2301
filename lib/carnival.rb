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
end
