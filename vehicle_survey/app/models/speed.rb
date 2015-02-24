class Speed

  def self.speed_per_session(vehicle_list)
    {Northbound: calculate_speed_by_time_period(vehicle_list[:Northbound]),
     Southbound: calculate_speed_by_time_period(vehicle_list[:Southbound])}
  end

  def self.calculate_speed_by_time_period(vehicle_list)
    vehicle_list.map do |vehicles|
      vehicles.map { |time| calculate_average_speed(time) }
    end
  end

  def self.calculate_average_speed(time)
    return 0 if time.size.equal?(0)
    total_speed = 0
    for duration in time
      total_speed += calculate_speed(duration[0], duration[1])
    end
    (total_speed / time.size).round(2)
  end

  def self.calculate_speed(start_time, end_time)
    (AVG_WHEEL_BASE / (end_time - start_time) * MSEC_TO_SEC).round(2)
  end

  def self.speed_per_day(speed_list, time_duration)
    {Northbound: ApplicationHelper.calc_avg_counts(speed_list[:vehicle_morn_vs_eve][:Northbound], time_duration),
     Southbound: ApplicationHelper.calc_avg_counts(speed_list[:vehicle_morn_vs_eve][:Southbound], time_duration)}
  end

end