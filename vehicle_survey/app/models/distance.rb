class Distance

  def self.distance_per_session(vehicle_list)
    {Northbound: calc_dist_by_time_period(vehicle_list[:Northbound]),
     Southbound: calc_dist_by_time_period(vehicle_list[:Southbound])}
  end

  def self.calc_dist_by_time_period(vehicle_list)
    vehicle_list.map do |vehicles|
      vehicles.map { |time| calculate_average_distance(time) }
    end
  end

  def self.calculate_average_distance(time)
    return 0 if time.size <= 1
    total_distance = 0
    for car in 0...(time.size - 1)
      total_distance += calculate_distance(time[car], time[car + 1])
    end
    (total_distance / (time.size - 1)).round(2)
  end

  def self.calculate_distance(previous_car, next_car)
    next_car_speed = Speed.calculate_speed(next_car[0], next_car[1])
    time_in_sec = (next_car[0] - previous_car[0]) / MSEC_TO_SEC
    (next_car_speed * time_in_sec).round(2)
  end

  def self.distance_report_per_day(distance_list)
    {morn_vs_eve_dist_per_day: distance_per_day(distance_list, MORN_VS_EVE_TIME_PERIOD),
     hour_dist_per_day: distance_per_day(distance_list, PER_HR_TIME_PERIOD),
     half_hour_dist_per_day: distance_per_day(distance_list, PER_HALF_HR_TIME_PERIOD),
     twenty_min_dist_per_day: distance_per_day(distance_list, PER_TWENTY_MIN_TIME_PERIOD),
     fifteen_min_dist_per_day: distance_per_day(distance_list, PER_FIFTEEN_MIN_TIME_PERIOD)}
  end

  def self.distance_per_day(distance_list, time_duration)
    {Northbound: ApplicationHelper.calc_avg_counts(distance_list[:vehicle_dist_morn_vs_eve][:Northbound], time_duration),
     Southbound: ApplicationHelper.calc_avg_counts(distance_list[:vehicle_dist_morn_vs_eve][:Southbound], time_duration)}
  end
end