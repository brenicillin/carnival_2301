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

  def info_hash
    hash = {
      :visitor_count => get_visitor_count,

      :total_revenue => total_revenue

      #:visitors => [{:visitor1=>[favorite_ride, money_spent], :visitor2=>[favorite_ride, money_spent]}],

      #:rides => [{:ride1=>[rider_log, total_revenue], :ride2=>[rider_log, total_revenue]}]
     }
  end

  def get_visitor_count
    arr = []
    @rides.each do |ride|
      arr << ride.rider_log.keys
    end
    arr.flatten.uniq.length
  end
end
