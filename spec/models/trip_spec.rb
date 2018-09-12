require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:duration)}
    it { should validate_presence_of(:start_date)}
    it { should validate_presence_of(:end_date)}
    it { should validate_presence_of(:bike_id)}
    it { should validate_presence_of(:subscription_type)}
    it { should validate_presence_of(:start_station_id)}
    it { should validate_presence_of(:end_station_id)}
  end
  describe 'relationships' do
    it { should belong_to(:start_station)}
    it { should belong_to(:end_station)}
  end
  describe 'methods' do
    it 'average_duration' do
      trip_1 = create(:trip, duration: 1)
      trip_2 = create(:trip, duration: 3)
      expect(Trip.average_duration).to eq(2)
    end
    it 'longest_ride' do
      trip_1 = create(:trip, duration: 1)
      trip_2 = create(:trip, duration: 3)
      expect(Trip.longest_ride).to eq(3)
    end
    it 'shortest_ride' do
      trip_1 = create(:trip, duration: 1)
      trip_2 = create(:trip, duration: 3)
      expect(Trip.shortest_ride).to eq(1)
    end
    it 'most_rides_start_station' do
      starting_station_1 = create(:station)
      starting_station_2 = create(:station)
      trip_1 = create(:trip, start_station_id: starting_station_1.id)
      trip_2 = create(:trip, start_station_id: starting_station_1.id)
      trip_3 = create(:trip, start_station_id: starting_station_2.id)
      expect(Trip.most_rides_start_station).to eq({1 => 2})
    end
    it 'most_rides_ending_station' do
      starting_station_1 = create(:station)
      starting_station_2 = create(:station)
      trip_1 = create(:trip, end_station_id: starting_station_1.id)
      trip_2 = create(:trip, end_station_id: starting_station_1.id)
      trip_3 = create(:trip, end_station_id: starting_station_2.id)
      expect(Trip.most_rides_end_station).to eq({3 => 1})
    end
    it 'most_ridden_bike' do
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 2)
      expect(Trip.most_ridden_bike).to eq({1 => 2})
    end
    it 'least_ridden_bike' do
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 2)
      expect(Trip.least_ridden_bike).to eq({2 => 1})
    end
    it 'date_with_most_trips' do
      trip = create(:trip, start_date: "2009-09-31")
      create(:trip, start_date: "2009-09-31")
      create(:trip, start_date: "2009-09-27")
      expect(Trip.date_with_most_trips).to eq({trip.start_date => 2})
    end
    it 'date_with_least_trips' do
      create(:trip, start_date: "2009-09-31")
      create(:trip, start_date: "2009-09-31")
      trip = create(:trip, start_date: "2009-09-27")
      expect(Trip.date_with_least_trips).to eq({trip.start_date => 1})
    end
    it 'subscription_counts' do
      create(:trip, subscription_type: "Subscriber")
      create(:trip, subscription_type: "Subscriber")
      create(:trip, subscription_type: "Customer")
      expect(Trip.subscription_counts).to eq({"Subscriber" => 2, "Customer" => 1})
    end
    it 'subscription_percents' do
      create(:trip, subscription_type: "Subscriber")
      create(:trip, subscription_type: "Subscriber")
      create(:trip, subscription_type: "Customer")
      expect(Trip.subscription_percents).to eq("Subscriber" => 66.67, "Customer" => 33.33)
    end
  end
end
