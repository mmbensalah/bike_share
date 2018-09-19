require 'rails_helper'

describe 'Visitors can see conditions show page' do
  context 'on visitor show page' do
    it 'displays all condition attributes' do
      condition = create(:condition)

      visit condition_path(condition)

      expect(page).to have_content(condition.date.in_time_zone("MST").strftime("%m/%d/%Y"))
      expect(page).to have_content(condition.max_temperature)
      expect(page).to have_content(condition.min_temperature)
      expect(page).to have_content(condition.mean_temperature)
      expect(page).to have_content(condition.mean_humidity)
      expect(page).to have_content(condition.mean_visibility)
      expect(page).to have_content(condition.mean_wind_speed)
      expect(page).to have_content(condition.precipitation)
    end
  end
end
