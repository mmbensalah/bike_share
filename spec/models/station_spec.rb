require 'rails_helper'

RSpec.describe Station, type: :model do
  before(:each) do
    @station_1 = Station.create!(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "2013-08-06")
    @station_2 = Station.create!(name: "Castro Station", dock_count: 25, city: "San Francisco", installation_date: "2013-08-06")
    @station_3 = Station.create!(name: "SFSU", dock_count: 25, city: "Daly City", installation_date: "2013-08-06")
    @trip_1 = Trip.create!(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 1, end_station_id: 1)
    @trip_2 = Trip.create!(duration: 77, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 26, subscription_type: "Subscriber", zip_code: 94103, start_station_id: 1, end_station_id: 2)
    @trip_3 = Trip.create!(duration: 1099, start_date: "2013-09-05", end_date: "2013-09-05", bike_id: 48, subscription_type: "Customer", zip_code: 10038, start_station_id: 3, end_station_id: 1)
    @trip_4 = Trip.create!(duration: 83, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 94103, start_station_id: 1, end_station_id: 1)
    @trip_5 = Trip.create!(duration: 109, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 679, subscription_type: "Subscriber", zip_code: 95112, start_station_id: 1, end_station_id: 2)
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:dock_count)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:installation_date)}
  end

  describe 'relationships' do
    it {should have_many(:start_trips)}
    it {should have_many(:end_trips)}
  end

  describe 'instance methods' do
    context '#ride_count' do
      it 'should return the number of rides started/ended at this station' do
        expect(@station_1.ride_count("started")).to eq(4)
        expect(@station_1.ride_count("ended")).to eq(3)
      end
    end

    context '#destination_station' do
      it 'should return station most frequently as the destination station' do
        expect(@station_1.destination_station).to eq({(@station_1.id) => 2})
      end
    end

    context '#origination_station' do
      it 'should return station most frequently as the origination station' do
        expect(@station_1.origination_station).to eq({(@station_1.id) => 2})
      end
    end

    context '#most_trips' do
      it 'should return Date when most trips were taken' do
        expect(@station_1.most_trips).to eq({@trip_1.start_date => 4})
      end
    end

    context '#top_zips' do
      it 'should return most frequent rider zip code' do
        expect(@station_1.top_zips).to eq({94103 => 2})
      end
    end

    context '#top_bike' do
      it 'should return bike id of most used bike' do
        expect(@station_1.top_bike).to eq({48 => 2})
      end
    end
  end
end
