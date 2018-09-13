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

  private
    def generate_slug
      self.slug = name.parameterize
    end
end
