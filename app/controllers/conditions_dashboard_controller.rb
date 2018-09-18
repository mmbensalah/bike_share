class ConditionsDashboardController < ApplicationController
  before_action :require_user

  def index
    @rides_ten_degrees_max   = format_array(Condition.rides_ten_degrees_max(90, 99))
    @rides_ten_degrees_max_1 = format_array(Condition.rides_ten_degrees_max(80, 89))
    @rides_ten_degrees_max_2 = format_array(Condition.rides_ten_degrees_max(70, 79))
    @rides_ten_degrees_max_3 = format_array(Condition.rides_ten_degrees_max(60, 69))
    @rides_ten_degrees_min   = format_array(Condition.rides_ten_degrees_min(90, 99))
    @rides_ten_degrees_min_1 = format_array(Condition.rides_ten_degrees_min(80, 89))
    @rides_ten_degrees_min_2 = format_array(Condition.rides_ten_degrees_min(70, 79))
    @rides_ten_degrees_min_3 = format_array(Condition.rides_ten_degrees_min(60, 69))
    @rides_ten_degrees_average_1 = Condition.average_rides_ten_degrees(90, 99).round
    @rides_ten_degrees_average_2 = Condition.average_rides_ten_degrees(80, 89).round
    @rides_ten_degrees_average_3 = Condition.average_rides_ten_degrees(70, 79).round
    @rides_ten_degrees_average_4 = Condition.average_rides_ten_degrees(60, 69).round

    @rides_precipitation_max   = format_array(Condition.rides_precipitation_max(0, 0.5))
    @rides_precipitation_max_1 = format_array(Condition.rides_precipitation_max(0.6, 1.0))
    @rides_precipitation_min   = format_array(Condition.rides_precipitation_min(0, 0.5))
    @rides_precipitation_min_1 = format_array(Condition.rides_precipitation_min(0.6, 1.0))
    @rides_precipitation_average_1 = Condition.average_rides_precipitation(0, 0.5).round
    @rides_precipitation_average_2 = Condition.average_rides_precipitation(0.6, 1.0).round

    @rides_mean_wind_speed_max   = format_array(Condition.rides_mean_wind_speed_max(0, 4))
    @rides_mean_wind_speed_max_1 = format_array(Condition.rides_mean_wind_speed_max(5, 9))
    @rides_mean_wind_speed_min   = format_array(Condition.rides_mean_wind_speed_min(0, 4))
    @rides_mean_wind_speed_min_1 = format_array(Condition.rides_mean_wind_speed_min(5, 9))
    @rides_mean_wind_speed_average_1 = Condition.average_rides_wind_speed(0, 4).round
    @rides_mean_wind_speed_average_2 = Condition.average_rides_wind_speed(5, 9).round

    @rides_mean_visibility_max_1 = format_array(Condition.rides_mean_visibility_max(10, 14))
    @rides_mean_visibility_max_2 = format_array(Condition.rides_mean_visibility_max(15, 19))
    @rides_mean_visibility_min_1 = format_array(Condition.rides_mean_visibility_max(10, 14))
    @rides_mean_visibility_min_2 = format_array(Condition.rides_mean_visibility_max(15, 19))
    @rides_mean_visibility_average_1 = Condition.average_rides_visibility(10, 14).round
    @rides_mean_visibility_average_2 = Condition.average_rides_visibility(15, 19).round
  end

  private

    def format_array(result)
      if result == []
        "No "
      else
        result[0]
      end
    end
end
