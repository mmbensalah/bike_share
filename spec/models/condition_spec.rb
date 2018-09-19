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

  describe ' class methods' do
    before(:each) do
      station_1 = create(:station)
      station_2 = create(:station)
      condition_1 = Condition.create(          date: "2013/8/29", max_temperature: 89, mean_temperature: 85, min_temperature: 79, mean_humidity: 50, mean_visibility: 0, mean_wind_speed: 4, precipitation: 0)
      condition_2 = Condition.create(          date: "2013/8/28", max_temperature: 80, mean_temperature: 84, min_temperature: 70, mean_humidity: 50, mean_visibility: 4, mean_wind_speed: 0, precipitation: 0.5)
      condition_3 = Condition.create(          date: "2013/8/27", max_temperature: 80, mean_temperature: 84, min_temperature: 70, mean_humidity: 50, mean_visibility: 10, mean_wind_speed: 10, precipitation: 0.6)
      condition_4 = Condition.create(          date: "2013/8/26", max_temperature: 80, mean_temperature: 84, min_temperature: 70, mean_humidity: 50, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0.6)
      condition_5 = Condition.create(          date: "2013/8/25", max_temperature: 80, mean_temperature: 84, min_temperature: 70, mean_humidity: 50, mean_visibility: 10, mean_wind_speed: 6, precipitation: 1.0)
      condition_6 = Condition.create(          date: "2013/8/24", max_temperature: 80, mean_temperature: 84, min_temperature: 70, mean_humidity: 50, mean_visibility: 10, mean_wind_speed: 10, precipitation: 0)
      condition_7 = Condition.create(          date: "2013/8/23", max_temperature: 75, mean_temperature: 70, min_temperature: 65, mean_humidity: 50, mean_visibility: 5, mean_wind_speed: 5, precipitation: 0.5)
      condition_3 = Condition.create(          date: "2013/8/22", max_temperature: 75, mean_temperature: 70, min_temperature: 65, mean_humidity: 50, mean_visibility: 9, mean_wind_speed: 5, precipitation: 0.66)

      trip_1 = Trip.create!(duration: 60, start_date: "2013/8/29", end_date: "2013/8/28", bike_id: 1, subscription_type: 'subscriber', start_station_id: 1, end_station_id: 1)
      trip_2 = Trip.create!(duration: 50, start_date: "2013/8/29", end_date: "2013/8/28", bike_id: 2, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
      trip_3 = Trip.create!(duration: 40, start_date: "2013/8/28", end_date: "2013/8/28", bike_id: 3, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
      trip_4 = Trip.create!(duration: 40, start_date: "2013/8/25", end_date: "2013/8/29", bike_id: 3, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
      trip_5 = Trip.create!(duration: 40, start_date: "2013/8/20", end_date: "2013/8/29", bike_id: 3, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
      trip_6 = Trip.create!(duration: 40, start_date: "2013/8/23", end_date: "2013/8/23", bike_id: 3, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
      trip_7 = Trip.create!(duration: 40, start_date: "2013/8/23", end_date: "2013/8/23", bike_id: 3, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
      trip_8 = Trip.create!(duration: 40, start_date: "2013/8/23", end_date: "2013/8/23", bike_id: 3, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
      trip_8 = Trip.create!(duration: 40, start_date: "2013/8/22", end_date: "2013/8/22", bike_id: 3, subscription_type: 'subscriber', start_station_id: 2, end_station_id: 2)
    end

    it '#rides_ten_degrees_max' do

      expect(Condition.rides_ten_degrees_max(80, 89)).to eq([2])
      expect(Condition.rides_ten_degrees_max(70, 79)).to eq([3])
    end

    it '#rides_ten_degrees_min' do

      expect(Condition.rides_ten_degrees_min(80, 89)).to eq([1])
      expect(Condition.rides_ten_degrees_min(70, 79)).to eq([1])
    end

    it '#rides_precipitation_max' do

      expect(Condition.rides_precipitation_max(0, 0.5)).to eq([3])
      expect(Condition.rides_precipitation_max(0.6, 1.0)).to eq([1])
    end

    it '#rides_precipitation_min' do

      expect(Condition.rides_precipitation_min(0, 0.5)).to eq([1])
      expect(Condition.rides_precipitation_min(0.6, 1.0)).to eq([1])
    end

    it '#rides_mean_wind_speed_max' do

      expect(Condition.rides_mean_wind_speed_max(0, 4)).to eq([2])
      expect(Condition.rides_mean_wind_speed_max(5, 9)).to eq([3])
    end

    it '#rides_mean_wind_speed_min' do

      expect(Condition.rides_mean_wind_speed_min(0, 4)).to eq([1])
      expect(Condition.rides_mean_wind_speed_min(5, 9)).to eq([1])
    end

    it '#rides_mean_visibility_max' do

      expect(Condition.rides_mean_visibility_max(0, 4)).to eq([2])
      expect(Condition.rides_mean_visibility_max(5, 9)).to eq([3])
    end

    it '#rides_mean_visibility_min' do

      expect(Condition.rides_mean_visibility_min(0, 4)).to eq([1])
      expect(Condition.rides_mean_visibility_min(5, 9)).to eq([1])
    end

    it '#average_rides' do
      expect(Condition.average_rides("max_temperature", 80, 89)).to eq(4/6.0)

      expect(Condition.average_rides("precipitation", 0, 0.5)).to eq(6/4.0)
      expect(Condition.average_rides("precipitation", 0.6, 1.0)).to eq(2/4.0)

      expect(Condition.average_rides("mean_wind_speed", 0, 4)).to eq(3/2.0)
      expect(Condition.average_rides("mean_wind_speed", 5, 9)).to eq(5/3.0)

      expect(Condition.average_rides("mean_visibility", 0, 4)).to eq(3/2.0)
      expect(Condition.average_rides("mean_visibility", 5, 9)).to eq(4/2.0)
    end
  end
end
