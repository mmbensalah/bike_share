class Station < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates_presence_of :dock_count,
                        :city,
                        :installation_date
  before_save :generate_slug
  has_many :start_trips, foreign_key: 'start_station_id', class_name: "Trip"
  has_many :end_trips, foreign_key: 'end_station_id', class_name: "Trip"

  def to_param
    slug
  end

  def show_data
    {
    ride_count_started: ride_count("started"),
    ride_count_ended: ride_count("ended"),
    destination_station: destination_station,
    origination_station: origination_station,
    most_trips: most_trips,
    top_zip_code: top_zips,
    top_bike: top_bike
    }
  end

  def ride_count(point)
    if point == "started"
      start_trips.where(start_station_id: self.id).count
    elsif point == "ended"
      end_trips.where(end_station_id: self.id).count
    end
  end

  def destination_station
    start_trips.order("count_id desc").limit(1).group(:end_station_id).count(:id)
  end

  def origination_station
    end_trips.order("count_id desc").limit(1).group(:start_station_id).count(:id)
  end

  def most_trips
    start_trips.order("count_id desc").limit(1).group(:start_date).count(:id)
  end

  def top_zips
    start_trips.order("count_id desc").limit(1).group(:zip_code).count(:id)
  end

  def top_bike
    start_trips.order("count_id desc").limit(1).group(:bike_id).count(:id)
  end

  private
    def generate_slug
      self.slug = name.parameterize
    end
end
