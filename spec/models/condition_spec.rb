require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :date}
    it { should validate_presence_of :max_temperature}
    it { should validate_presence_of :min_temperature}
    it { should validate_presence_of :mean_temperature}
    it { should validate_presence_of :mean_humidity}
    it { should validate_presence_of :mean_visibility}
    it { should validate_presence_of :mean_wind_speed}
    it { should validate_presence_of :precipitation}
  end

  describe 'methods' do
    before(:each) do
      condition_1 = Condition.create(date: 8/29/2013, max_temperature: 90, mean_temperature: 85, min_temperature: 80, mean_humidity: 50, mean_visibility: 10, mean_wind_speed: 10, precipitation: 0)
      condition_2 = Condition.create(date: 8/28/2013, max_temperature: 89, mean_temperature: 84, min_temperature: 79, mean_humidity: 50, mean_visibility: 10, mean_wind_speed: 10, precipitation: 0)
      trip_1 = Trip.create(duration: 60, start_date: 8/29/2013, end_date: 8/29/2013, bike_id: 1, subscription_type: 'subscriber', start_station_id: 1, end_station_id: 1)
      trip_2 = Trip.create(duration: 50, start_date: 8/28/2013, end_date: 8/28/2013, bike_id: 2, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
      trip_3 = Trip.create(duration: 40, start_date: 8/28/2013, end_date: 8/28/2013, bike_id: 3, subscription_type: 'subscriber', start_station_id: 3, end_station_id: 3)
    end

    it '#average_rides_ten_degrees' do
      expect(Condition.average_rides_ten_degrees).to eq()
    end




    xit 'max rides in 10 degree increments' do
    end
    xit 'min rides in 10 degree inrements' do
    end
  end
end
