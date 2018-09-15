require 'rails_helper'

RSpec.describe Station, type: :model do
  before(:each) do
    @station_1 = Station.create!(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "2013-08-06")
    @station_2 = Station.create!(name: "Castro Station", dock_count: 25, city: "San Francisco", installation_date: "2013-08-16")
    @station_3 = Station.create!(name: "SFSU", dock_count: 25, city: "Daly City", installation_date: "2013-08-26")
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
        expect(@station_1.destination_station).to eq(@station_1)
        expect(@station_1.destination_station.station_count).to eq(2)
      end
    end

    context '#origination_station' do
      it 'should return station most frequently as the origination station' do
        expect(@station_1.origination_station).to eq(@station_1)
        expect(@station_1.origination_station.station_count).to eq(2)
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

    context '#show_data' do
      it 'should return a hash with all data needed for show page' do
        expect(@station_1.show_data).to eq({
                                          ride_count_started: @station_1.ride_count("started"),
                                          ride_count_ended: @station_1.ride_count("ended"),
                                          destination_station: [@station_1.destination_station.name, @station_1.destination_station.station_count],
                                          origination_station: [@station_1.origination_station.name, @station_1.origination_station.station_count],
                                          most_trips: @station_1.most_trips,
                                          top_zip_code: @station_1.top_zips,
                                          top_bike: @station_1.top_bike
                                          })
      end
    end
  end

  describe "class methods" do
    context ".total_stations" do
      it 'should return total count of all stations' do
        expect(Station.total_stations).to eq(3)
      end
    end

    context ".avg_number_bikes" do
      it 'should return average number of bikes at station' do
        expect(Station.avg_number_bikes).to eq(25.67)
      end
    end

    context ".most_bikes" do
      it 'should return station with most bikes' do
        expect(Station.most_bikes).to eq([@station_1])
      end
    end

    context ".least_bikes" do
      it 'should return station with least bikes' do
        expect(Station.least_bikes).to eq([@station_2, @station_3])
      end
    end

    context ".newest" do
      it 'should return station(s) installed most recently' do
        expect(Station.newest).to eq([@station_3])
      end
    end

    context ".oldest" do
      it 'should return oldest station(s)' do
        expect(Station.oldest).to eq([@station_1])
      end
    end
  end
end
