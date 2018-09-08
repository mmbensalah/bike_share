require 'rails_helper'

describe 'visitor can see index of all conditions' do
  context 'on the conditions index page' do
  it 'visitor can see all conditions and attributes' do
    condition = create(:condition)
    condition_1 = create(:condition)

    visit conditions_path

    expect(page).to have_content(condition.date)
    expect(page).to have_content(condition.max_temperature)
    expect(page).to have_content(condition.min_temperature)
    expect(page).to have_content(condition.mean_temperature)
    expect(page).to have_content(condition.mean_humidity)
    expect(page).to have_content(condition.mean_visibility)
    expect(page).to have_content(condition.mean_wind_speed)
    expect(page).to have_content(condition.precipitation)
    expect(page).to have_content(condition_1.date)
    expect(page).to have_content(condition_1.max_temperature)
    expect(page).to have_content(condition_1.min_temperature)
    expect(page).to have_content(condition_1.mean_temperature)
    expect(page).to have_content(condition_1.mean_humidity)
    expect(page).to have_content(condition_1.mean_visibility)
    expect(page).to have_content(condition_1.mean_wind_speed)
    expect(page).to have_content(condition_1.precipitation)
    end
  end
end
