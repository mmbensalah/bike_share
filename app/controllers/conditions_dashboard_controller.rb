class ConditionsDashboardController < ApplicationController
  before_action :require_user

  def index
    @rides_ten_degrees_max   = Condition.rides_ten_degrees_max(90, 99)
    @rides_ten_degrees_max_1 = Condition.rides_ten_degrees_max(80, 89)
    @rides_ten_degrees_max_2 = Condition.rides_ten_degrees_max(70, 79)
    @rides_ten_degrees_max_3 = Condition.rides_ten_degrees_max(60, 69)
    @rides_ten_degrees_min   = Condition.rides_ten_degrees_min(90, 99)
    @rides_ten_degrees_min_1 = Condition.rides_ten_degrees_min(80, 89)
    @rides_ten_degrees_min_2 = Condition.rides_ten_degrees_min(70, 79)
    @rides_ten_degrees_min_3 = Condition.rides_ten_degrees_min(60, 69)
    @rides_precipitation_max   = Condition.rides_precipitation_max(0, 0.5)
    @rides_precipitation_max_1 = Condition.rides_precipitation_max(0.6, 1.0)
    @rides_precipitation_min   = Condition.rides_precipitation_min(0, 0.5)
    @rides_precipitation_min_1 = Condition.rides_precipitation_min(0.6, 1.0)
    @rides_mean_wind_speed_max   = Condition.rides_mean_wind_speed_max(0, 4)
    @rides_mean_wind_speed_max_1 = Condition.rides_mean_wind_speed_max(5, 9)
    @rides_mean_wind_speed_min   = Condition.rides_mean_wind_speed_min(0, 4)
    @rides_mean_wind_speed_min_1 = Condition.rides_mean_wind_speed_min(5, 9)
    @rides_mean_visibility_max_1 = Condition.rides_mean_visibility_max(10, 14)
    @rides_mean_visibility_max_2 = Condition.rides_mean_visibility_max(15, 19)
    @rides_mean_visibility_min_1 = Condition.rides_mean_visibility_max(10, 14)
    @rides_mean_visibility_min_2 = Condition.rides_mean_visibility_max(15, 19)
  end
end
