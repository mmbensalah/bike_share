class Trip < ApplicationRecord
  belongs_to :start_station, class_name: "Station", foreign_key: :start_station_id
  belongs_to :end_station, class_name: "Station", foreign_key: :end_station_id
end
