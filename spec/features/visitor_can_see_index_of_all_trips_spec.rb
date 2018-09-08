require 'rails_helper'

describe 'visitor can see all trips' do
  describe 'on the trips index page' do
    it 'shows the first 30 trips along with all their attributes' do
      require 'pry'; binding.pry
      31.times do
        create(:trip)
      end

      visit trips_path

      expect(page).to have_content


    end
  end
end
