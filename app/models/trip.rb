class Trip < ApplicationRecord
  paginates_per 30
  validates_presence_of :duration,
                        :start_date,
                        :end_date,
                        :bike_id,
                        :subscription_type,
                        :start_station_id,
                        :end_station_id

  belongs_to :start_station, class_name: "Station", foreign_key: :start_station_id
  belongs_to :end_station, class_name: "Station", foreign_key: :end_station_id

  def self.average_duration
    (average(:duration) / 60).round(2)
  end

  def self.longest_ride
    find_by(duration: maximum(:duration))
  end

  def self.shortest_ride
    find_by(duration: minimum(:duration))
  end

  def self.most_rides_start_station
    station_id_count = order("count_all desc")
                       .limit(1)
                       .group(:start_station_id)
                       .count
    Station.find(station_id_count.keys[0])
  end

  def self.most_rides_end_station
    station_id_count = order("count_all desc")
                       .limit(1)
                       .group(:end_station_id)
                       .count
    Station.find(station_id_count.keys[0])
  end

  def self.most_ridden_bike
    bike_count = order("count_id DESC")
                 .limit(1)
                 .group(:bike_id)
                 .count(:id)
                 .to_a.flatten
    { bike: bike_count[0], count: bike_count[1] }
  end

  def self.least_ridden_bike
    bike_count = order("count_id ASC")
                 .limit(1)
                 .group(:bike_id)
                 .count(:id).to_a.flatten
    { bike: bike_count[0], count: bike_count[1] }
  end

  def self.date_with_most_trips
    date_trips = order("count_id DESC")
                 .limit(1)
                 .group(:start_date)
                 .count(:id).to_a.flatten
    { date: date_trips[0], trips: date_trips[1] }
  end

  def self.date_with_least_trips
    date_trips = order("count_id ASC")
                 .limit(1)
                 .group(:start_date)
                 .count(:id).to_a.flatten
    { date: date_trips[0], trips: date_trips[1] }
  end

  def self.subscription_counts
    group(:subscription_type).count(:id)
  end

  def self.subscription_percents
    subscription_counts.transform_values do |v|
      (v / Trip.count.to_f * 100).round(2)
    end
  end

  def self.rides_per_month
    months = group("DATE_TRUNC('month', start_date)").count
    months.transform_keys! {|key| key.strftime("%B")}
  end

  def self.get_years
    select("start_date").map{ |trip| trip.start_date.year }.uniq
  end

  def self.rides_per_year(*years)
    all_years = []
    years.each do |year|
      all_years << { year => Trip.by_year(year, field: :start_date).count }
    end
    all_years
  end
end
