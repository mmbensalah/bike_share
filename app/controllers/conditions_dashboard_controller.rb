class ConditionsDashboardController < ApplicationController
  before_action :require_user
  def index
    @day_most_rides = rides_ten_degrees_max(start_temp, end_temp)
  end
end
