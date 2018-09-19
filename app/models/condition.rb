class Condition < ApplicationRecord
  validates_presence_of :date,
                        :max_temperature,
                        :min_temperature,
                        :mean_temperature,
                        :mean_humidity,
                        :mean_visibility,
                        :mean_wind_speed,
                        :precipitation

  def self.rides_ten_degrees_max(start_temp, end_temp)
    response = Trip.select("trips.start_date")
                .joins("join conditions on conditions.date = trips.start_date")
                .where("conditions.max_temperature between #{start_temp} and #{end_temp}")
                .order("count_id desc")
                .limit(1)
                .group(:start_date)
                .count(:id)
    response.values
  end

  def self.rides_ten_degrees_min(start_temp, end_temp)
    response = Trip.select("trips.start_date")
                .joins("join conditions on conditions.date = trips.start_date")
                .where("conditions.max_temperature between #{start_temp} and #{end_temp}")
                .order("count_id asc")
                .limit(1)
                .group(:start_date)
                .count(:id)
    response.values
  end

  def self.rides_precipitation_max(start_amount, end_amount)
    response = Trip.select("trips.start_date")
                .joins("join conditions on conditions.date = trips.start_date")
                .where("conditions.precipitation between #{start_amount} and #{end_amount}")
                .order("count_id desc")
                .limit(1)
                .group(:start_date)
                .count(:id)
    response.values
  end

  def self.rides_precipitation_min(start_amount, end_amount)
    response = Trip.select("trips.start_date")
                .joins("join conditions on conditions.date = trips.start_date")
                .where("conditions.precipitation between #{start_amount} and #{end_amount}")
                .order("count_id asc")
                .limit(1)
                .group(:start_date)
                .count(:id)
    response.values
  end

  def self.rides_mean_wind_speed_max(start_amount, end_amount)
    response = Trip.select("trips.start_date")
                .joins("join conditions on conditions.date = trips.start_date")
                .where("conditions.mean_wind_speed between #{start_amount} and #{end_amount}")
                .order("count_id desc")
                .limit(1)
                .group(:start_date)
                .count(:id)
    response.values
  end

  def self.rides_mean_wind_speed_min(start_amount, end_amount)
    response = Trip.select("trips.start_date")
                .joins("join conditions on conditions.date = trips.start_date")
                .where("conditions.mean_wind_speed between #{start_amount} and #{end_amount}")
                .order("count_id asc")
                .limit(1)
                .group(:start_date)
                .count(:id)
    response.values
  end

  def self.rides_mean_visibility_max(start_amount, end_amount)
    response = Trip.select("trips.start_date")
                .joins("join conditions on conditions.date = trips.start_date")
                .where("conditions.mean_visibility between #{start_amount} and #{end_amount}")
                .order("count_id desc")
                .limit(1)
                .group(:start_date)
                .count(:id)
    response.values
  end

  def self.rides_mean_visibility_min(start_amount, end_amount)
    response = Trip.select("trips.start_date")
                .joins("join conditions on conditions.date = trips.start_date")
                .where("conditions.mean_visibility between #{start_amount} and #{end_amount}")
                .order("count_id asc")
                .limit(1)
                .group(:start_date)
                .count(:id)
    response.values
  end

  def self.average_rides(attribute, start_amount, end_amount)
    dates_count = Condition.select(:date).where("conditions.#{attribute} between #{start_amount} and #{end_amount}").count(:id)
    trips = Trip.select("trips.start_date")
    .joins("join conditions on conditions.date = trips.start_date")
    .where("conditions.#{attribute} between #{start_amount} and #{end_amount}")
    .group(:start_date)
    .count(:id)
    (trips.values.sum) / (dates_count.to_f)
  end
end
