require 'rails_helper'

describe 'admin can delete a trip' do
  describe 'on admin trip index page' do
    it 'clicks delete, and it returns admin to index with trip destroyed' do
        admin = create(:user, role:1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        trip = create(:trip)

        visit trips_path
        click_on "Delete"

        expect(current_path).to eq trips_path
        expect(page).to have_content("Trip successfully destroyed!")
        expect(Trip.all.count).to eq(0)
      end
    end
  end
