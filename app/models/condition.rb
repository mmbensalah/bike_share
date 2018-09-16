class Condition < ApplicationRecord
  validates_presence_of :date,
                        :max_temperature,
                        :min_temperature,
                        :mean_temperature,
                        :mean_humidity,
                        :mean_visibility,
                        :mean_wind_speed,
                        :precipitation

  def self.average_rides_ten_degrees
    Trip.select("start_date, COUNT(trips.id) AS count")
      .joins("JOIN conditions ON conditions.date = trips.start_date")
        .where("max_temperature BETWEEN ? and ?", 80, 89.9)
          .group(:start_date)
            .order("count(trips.id) desc")
              .limit(1)
                .count(:id)
  end
end
