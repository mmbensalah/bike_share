require 'rails_helper'

describe 'admin can edit a condition' do
  describe 'on admin edit condition page' do
    it 'fills in all condition attributes and can edit a condition' do
        admin = create(:user, role:1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        condition = create(:condition)

        visit edit_admin_condition_path(condition)
        fill_in :condition_date, with: "2007-09-15"
        fill_in :condition_max_temperature, with: 80
        fill_in :condition_min_temperature, with: 60
        fill_in :condition_mean_temperature, with: 70
        fill_in :condition_mean_humidity, with: 34
        fill_in :condition_mean_visibility, with: 5
        fill_in :condition_mean_wind_speed, with: 7
        fill_in :condition_precipitation, with: 4.2
        click_on "Update Condition"

        expect(current_path).to eq condition_path(condition)
        expect(page).to have_content("You successfully edited a condition!")
        expect(Condition.first.max_temperature).to eq(80)
    end
  end
  describe "User can't edit a condition" do
    it "won't allow user to visit edit condition page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      condition = create(:condition)
      visit edit_admin_condition_path(condition)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
