require 'rails_helper'

describe 'admin can create new condition' do
  describe 'on admin new condition page' do
    it 'fills in all condition attributes and clicks create a new condition, a flash message
        appears showing I succesfully created a condition' do
        admin = create(:user, role:1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit new_admin_condition_path
        fill_in :condition_date, with: "2007-09-15"
        fill_in :condition_max_temperature, with: 80
        fill_in :condition_min_temperature, with: 60
        fill_in :condition_mean_temperature, with: 70
        fill_in :condition_mean_humidity, with: 34
        fill_in :condition_mean_visibility, with: 5
        fill_in :condition_mean_wind_speed, with: 7
        fill_in :condition_precipitation, with: 4.2

        click_on "Create Condition"
        expect(Condition.count).to eq(1)

        condition = Condition.first
        expect(current_path).to eq condition_path(condition)
        expect(page).to have_content("You successfully created a condition!")
    end
  end
  describe "User can't create a new condition" do
    it "won't allow user to visit new condition page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_condition_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
