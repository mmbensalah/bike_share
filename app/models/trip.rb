class Trip < ApplicationRecord
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
    Trip.average(:duration)
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.shortest_ride
    Trip.minimum(:duration)
  end

  def self.most_rides_start_station
    Trip.order("count_all desc").limit(1).group(:start_station_id).count
  end

  def self.most_rides_end_station
    Trip.order("count_all asc").limit(1).group(:start_station_id).count
  end

  def self.most_ridden_bike
    Trip.order("count_id desc").limit(1).group(:bike_id).count(:id)
  end

  def self.least_ridden_bike
    Trip.order("count_id asc").limit(1).group(:bike_id).count(:id)
  end

  def self.date_with_most_trips
    Trip.order("count_id DESC").limit(1).group(:start_date).count(:id)
  end

  def self.date_with_least_trips
    Trip.order("count_id ASC").limit(1).group(:start_date).count(:id)
  end

  def self.subscription_counts
    Trip.group(:subscription_type).count(:id)
  end

  def self.subscription_percents
    subscription_counts.transform_values do |v|
      (v / Trip.count.to_f * 100).round(2)
    end
  end

  def self.rides_per_month(*months)
    rides_per_month = {}
    months.each do |month|
      rides_per_month[month] = Trip.by_month(month, field: :start_date, year: Trip.first.start_date.year).count
    end
    rides_per_month
  end

  def self.rides_per_year(year)
    {year => Trip.by_year(year, field: :start_date).count}
  end


end
