class ReportsController < ApplicationController
  before_filter :vehicle_count_by_direction, only: :peak_volume_times

  def vehicle_count_by_direction
    @vehicle_count = Report.vehicle_count_report VEHICLE_LIST
  end

  def distance_between_cars
    @distance_report = Report.distance_report_per_session(VEHICLE_LIST)
    @distance_per_day_report = Report.distance_report_per_day(@distance_report)
  end

  def traffic_speed_distribution
    @speed_report = Report.speed_report_per_session VEHICLE_LIST
    @speed_per_day_report = Report.speed_report_per_day(@speed_report)
  end

  def peak_volume_times
    @peak_volume_report = Report.peak_volume_time_report @vehicle_count
  end
end
