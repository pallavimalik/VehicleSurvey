class Report
  include ApplicationHelper

  def self.vehicle_count_report(vehicle_list)
    total_vehicle_count = Vehicle.total_vehicle_count(vehicle_list[0]) + Vehicle.total_vehicle_count(vehicle_list[1])

    total_vehicle_count_by_dir = {Northbound: Vehicle.total_vehicle_count(vehicle_list[0]), Southbound: Vehicle.total_vehicle_count(vehicle_list[1])}

    vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min = ApplicationHelper.group_by_period(vehicle_list)

    vehicle_count_morn_vs_eve, vehicle_count_per_fifteen_min, vehicle_count_per_half_hr, vehicle_count_per_hr, vehicle_count_per_twenty_min = Vehicle.calculate_count(vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min)

    average_count_morn_vs_eve, average_count_per_fifteen_min, average_count_per_half_hr, average_count_per_hr, average_count_per_twenty_min = ApplicationHelper.calculate_avg(vehicle_count_morn_vs_eve, vehicle_count_per_fifteen_min, vehicle_count_per_half_hr, vehicle_count_per_hr, vehicle_count_per_twenty_min)

    {total_vehicle_count: total_vehicle_count,
     total_vehicle_count_by_dir: total_vehicle_count_by_dir,
     vehicle_count_morn_vs_eve: vehicle_count_morn_vs_eve,
     vehicle_count_per_hr: vehicle_count_per_hr,
     vehicle_count_per_half_hr: vehicle_count_per_half_hr,
     vehicle_count_per_twenty_min: vehicle_count_per_twenty_min,
     vehicle_count_per_fifteen_min: vehicle_count_per_fifteen_min,
     average_count_per_hr: average_count_per_hr,
     average_count_per_half_hr: average_count_per_half_hr,
     average_count_per_twenty_min: average_count_per_twenty_min,
     average_count_per_fifteen_min: average_count_per_fifteen_min,
     average_count_morn_vs_eve: average_count_morn_vs_eve}
  end

  def self.speed_report_per_session(vehicle_list)
    vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min = ApplicationHelper.group_by_period(vehicle_list)

    {vehicle_morn_vs_eve: Speed.speed_per_session(vehicle_morn_vs_eve),
     vehicle_speed_per_hr: Speed.speed_per_session(vehicle_per_hr),
     vehicle_speed_per_half_hr: Speed.speed_per_session(vehicle_per_half_hr),
     vehicle_speed_per_twenty_min: Speed.speed_per_session(vehicle_per_twenty_min),
     vehicle_speed_per_fifteen_min: Speed.speed_per_session(vehicle_per_fifteen_min)}
  end

  def self.speed_report_per_day(speed_list)
    {morn_vs_eve_speed_per_day: Speed.speed_per_day(speed_list, MORN_VS_EVE_TIME_PERIOD),
     hour_speed_per_day: Speed.speed_per_day(speed_list, PER_HR_TIME_PERIOD),
     half_hour_speed_per_day: Speed.speed_per_day(speed_list, PER_HALF_HR_TIME_PERIOD),
     twenty_min_speed_per_day: Speed.speed_per_day(speed_list, PER_TWENTY_MIN_TIME_PERIOD),
     fifteen_min_speed_per_day: Speed.speed_per_day(speed_list, PER_FIFTEEN_MIN_TIME_PERIOD)}
  end

  def self.distance_report_per_session(vehicle_list)
    vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min = ApplicationHelper.group_by_period(vehicle_list)

    {vehicle_dist_morn_vs_eve: Distance.distance_per_session(vehicle_morn_vs_eve),
     vehicle_dist_per_hr: Distance.distance_per_session(vehicle_per_hr),
     vehicle_dist_per_half_hr: Distance.distance_per_session(vehicle_per_half_hr),
     vehicle_dist_per_twenty_min: Distance.distance_per_session(vehicle_per_twenty_min),
     vehicle_dist_per_fifteen_min: Distance.distance_per_session(vehicle_per_fifteen_min)}
  end

  def self.distance_report_per_day(distance_list)
    {morn_vs_eve_dist_per_day: Distance.distance_per_day(distance_list, MORN_VS_EVE_TIME_PERIOD),
     hour_dist_per_day: Distance.distance_per_day(distance_list, PER_HR_TIME_PERIOD),
     half_hour_dist_per_day: Distance.distance_per_day(distance_list, PER_HALF_HR_TIME_PERIOD),
     twenty_min_dist_per_day: Distance.distance_per_day(distance_list, PER_TWENTY_MIN_TIME_PERIOD),
     fifteen_min_dist_per_day: Distance.distance_per_day(distance_list, PER_FIFTEEN_MIN_TIME_PERIOD)}
  end

  def self.peak_volume_time_report(count_list)
    {morn_vs_eve_peak_time_per_day: PeakVolume.peak_time(count_list, MORN_VS_EVE_TIME_PERIOD),
     hour_peak_time_per_day: PeakVolume.peak_time(count_list, PER_HR_TIME_PERIOD),
     half_hour_peak_time_per_day: PeakVolume.peak_time(count_list, PER_HALF_HR_TIME_PERIOD),
     twenty_min_peak_time_per_day: PeakVolume.peak_time(count_list, PER_TWENTY_MIN_TIME_PERIOD),
     fifteen_min_peak_time_per_day: PeakVolume.peak_time(count_list, PER_FIFTEEN_MIN_TIME_PERIOD)}
  end

  def self.parse_file
    FileParser.read_file('lib/stubs/Vehicle Survey Coding Challenge sample data.txt')
  end
end



