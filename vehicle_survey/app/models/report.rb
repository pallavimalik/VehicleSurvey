class Report
  def self.vehicle_count_report(vehicle_list)
    total_vehicle_count = total_vehicle_count(vehicle_list[0]) + total_vehicle_count(vehicle_list[1])
    total_vehicle_count_by_dir = { Northbound: total_vehicle_count(vehicle_list[0]), Southbound: total_vehicle_count(vehicle_list[1]) }

    vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min = group_by_period(vehicle_list)

    vehicle_count_morn_vs_eve, vehicle_count_per_fifteen_min, vehicle_count_per_half_hr, vehicle_count_per_hr, vehicle_count_per_twenty_min = calculate_count(vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min)

    average_count_morn_vs_eve, average_count_per_fifteen_min, average_count_per_half_hr, average_count_per_hr, average_count_per_twenty_min = calculate_avg(vehicle_count_morn_vs_eve, vehicle_count_per_fifteen_min, vehicle_count_per_half_hr, vehicle_count_per_hr, vehicle_count_per_twenty_min)

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

  def self.calculate_avg(vehicle_count_morn_vs_eve, vehicle_count_per_fifteen_min, vehicle_count_per_half_hr, vehicle_count_per_hr, vehicle_count_per_twenty_min)
    average_count_morn_vs_eve = { Northbound: calc_avg_counts(vehicle_count_morn_vs_eve[:Northbound], MORN_VS_EVE_TIME_PERIOD),
                                 Southbound: calc_avg_counts(vehicle_count_morn_vs_eve[:Southbound], MORN_VS_EVE_TIME_PERIOD) }
    average_count_per_hr = { Northbound: calc_avg_counts(vehicle_count_per_hr[:Northbound], PER_HR_TIME_PERIOD),
                            Southbound: calc_avg_counts(vehicle_count_per_hr[:Southbound], PER_HR_TIME_PERIOD) }
    average_count_per_half_hr = { Northbound: calc_avg_counts(vehicle_count_per_half_hr[:Northbound], PER_HALF_HR_TIME_PERIOD),
                                 Southbound: calc_avg_counts(vehicle_count_per_half_hr[:Southbound], PER_HALF_HR_TIME_PERIOD) }
    average_count_per_fifteen_min = { Northbound: calc_avg_counts(vehicle_count_per_fifteen_min[:Northbound], PER_FIFTEEN_MIN_TIME_PERIOD),
                                     Southbound: calc_avg_counts(vehicle_count_per_fifteen_min[:Southbound], PER_FIFTEEN_MIN_TIME_PERIOD) }
    average_count_per_twenty_min = { Northbound: calc_avg_counts(vehicle_count_per_twenty_min[:Northbound], PER_TWENTY_MIN_TIME_PERIOD),
                                    Southbound: calc_avg_counts(vehicle_count_per_twenty_min[:Southbound], PER_TWENTY_MIN_TIME_PERIOD) }
    return average_count_morn_vs_eve, average_count_per_fifteen_min, average_count_per_half_hr, average_count_per_hr, average_count_per_twenty_min
  end

  def self.calculate_count(vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min)
    vehicle_count_per_hr = { Northbound: vehicle_count(vehicle_per_hr[:Northbound]), Southbound: vehicle_count(vehicle_per_hr[:Southbound]) }
    vehicle_count_per_half_hr = { Northbound: vehicle_count(vehicle_per_half_hr[:Northbound]), Southbound: vehicle_count(vehicle_per_half_hr[:Southbound]) }
    vehicle_count_per_twenty_min = { Northbound: vehicle_count(vehicle_per_twenty_min[:Northbound]), Southbound: vehicle_count(vehicle_per_twenty_min[:Southbound]) }
    vehicle_count_per_fifteen_min = { Northbound: vehicle_count(vehicle_per_fifteen_min[:Northbound]), Southbound: vehicle_count(vehicle_per_fifteen_min[:Southbound]) }
    vehicle_count_morn_vs_eve = { Northbound: vehicle_count(vehicle_morn_vs_eve[:Northbound]), Southbound: vehicle_count(vehicle_morn_vs_eve[:Southbound]) }
    return vehicle_count_morn_vs_eve, vehicle_count_per_fifteen_min, vehicle_count_per_half_hr, vehicle_count_per_hr, vehicle_count_per_twenty_min
  end

  def self.group_by_period(vehicle_list)
    return { Northbound: (group_by_time_period [vehicle_list[0]], MORN_VS_EVE_TIME_PERIOD), Southbound: (group_by_time_period [vehicle_list[1]], MORN_VS_EVE_TIME_PERIOD) },
      { Northbound: (group_by_time_period [vehicle_list[0]], PER_FIFTEEN_MIN_TIME_PERIOD), Southbound: (group_by_time_period [vehicle_list[1]], PER_FIFTEEN_MIN_TIME_PERIOD) },
      { Northbound: (group_by_time_period [vehicle_list[0]], PER_HALF_HR_TIME_PERIOD), Southbound: (group_by_time_period [vehicle_list[1]], PER_HALF_HR_TIME_PERIOD) },
      { Northbound: (group_by_time_period [vehicle_list[0]], PER_HR_TIME_PERIOD), Southbound: (group_by_time_period [vehicle_list[1]], PER_HR_TIME_PERIOD) },
      { Northbound: (group_by_time_period [vehicle_list[0]], PER_TWENTY_MIN_TIME_PERIOD), Southbound: (group_by_time_period [vehicle_list[1]], PER_TWENTY_MIN_TIME_PERIOD) }
  end

  def self.speed_report_per_session(vehicle_list)
    vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min = group_by_period(vehicle_list)
    { vehicle_morn_vs_eve: { Northbound: calculate_speed_by_time_period(vehicle_morn_vs_eve[:Northbound]), Southbound: calculate_speed_by_time_period(vehicle_morn_vs_eve[:Southbound]) },
     vehicle_speed_per_hr: { Northbound: calculate_speed_by_time_period(vehicle_per_hr[:Northbound]), Southbound: calculate_speed_by_time_period(vehicle_per_hr[:Southbound]) },
     vehicle_speed_per_half_hr: { Northbound: calculate_speed_by_time_period(vehicle_per_half_hr[:Northbound]), Southbound: calculate_speed_by_time_period(vehicle_per_half_hr[:Southbound]) },
     vehicle_speed_per_twenty_min: { Northbound: calculate_speed_by_time_period(vehicle_per_twenty_min[:Northbound]), Southbound: calculate_speed_by_time_period(vehicle_per_twenty_min[:Southbound]) },
     vehicle_speed_per_fifteen_min: { Northbound: calculate_speed_by_time_period(vehicle_per_fifteen_min[:Northbound]), Southbound: calculate_speed_by_time_period(vehicle_per_fifteen_min[:Southbound]) } }
  end

  def self.speed_report_per_day(speed_list)
    { morn_vs_eve_speed_per_day: { Northbound: calc_avg_counts(speed_list[:vehicle_morn_vs_eve][:Northbound], MORN_VS_EVE_TIME_PERIOD), Southbound: calc_avg_counts(speed_list[:vehicle_morn_vs_eve][:Southbound], MORN_VS_EVE_TIME_PERIOD) },
     hour_speed_per_day: { Northbound: calc_avg_counts(speed_list[:vehicle_speed_per_hr][:Northbound], PER_HR_TIME_PERIOD), Southbound: calc_avg_counts(speed_list[:vehicle_speed_per_hr][:Southbound], PER_HR_TIME_PERIOD) },
     half_hour_speed_per_day: { Northbound: calc_avg_counts(speed_list[:vehicle_speed_per_half_hr][:Northbound], PER_HALF_HR_TIME_PERIOD), Southbound: calc_avg_counts(speed_list[:vehicle_speed_per_half_hr][:Southbound], PER_HALF_HR_TIME_PERIOD) },
     twenty_min_speed_per_day: { Northbound: calc_avg_counts(speed_list[:vehicle_speed_per_twenty_min][:Northbound], PER_TWENTY_MIN_TIME_PERIOD), Southbound: calc_avg_counts(speed_list[:vehicle_speed_per_twenty_min][:Southbound], PER_TWENTY_MIN_TIME_PERIOD) },
     fifteen_min_speed_per_day: { Northbound: calc_avg_counts(speed_list[:vehicle_speed_per_fifteen_min][:Northbound], PER_FIFTEEN_MIN_TIME_PERIOD), Southbound: calc_avg_counts(speed_list[:vehicle_speed_per_fifteen_min][:Southbound], PER_FIFTEEN_MIN_TIME_PERIOD) } }
  end

  def self.distance_report_per_session(vehicle_list)
    vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min = group_by_period(vehicle_list)

    { vehicle_dist_morn_vs_eve: { Northbound: calc_dist_by_time_period(vehicle_morn_vs_eve[:Northbound]), Southbound: calc_dist_by_time_period(vehicle_morn_vs_eve[:Southbound]) },
     vehicle_dist_per_hr: { Northbound: calc_dist_by_time_period(vehicle_per_hr[:Northbound]), Southbound: calc_dist_by_time_period(vehicle_per_hr[:Southbound]) },
     vehicle_dist_per_half_hr: { Northbound: calc_dist_by_time_period(vehicle_per_half_hr[:Northbound]), Southbound: calc_dist_by_time_period(vehicle_per_half_hr[:Southbound]) },
     vehicle_dist_per_twenty_min: { Northbound: calc_dist_by_time_period(vehicle_per_twenty_min[:Northbound]), Southbound: calc_dist_by_time_period(vehicle_per_twenty_min[:Southbound]) },
     vehicle_dist_per_fifteen_min: { Northbound: calc_dist_by_time_period(vehicle_per_fifteen_min[:Northbound]), Southbound: calc_dist_by_time_period(vehicle_per_fifteen_min[:Southbound]) } }
  end

  def self.distance_report_per_day(distance_list)
    { morn_vs_eve_dist_per_day: { Northbound: calc_avg_counts(distance_list[:vehicle_dist_morn_vs_eve][:Northbound], MORN_VS_EVE_TIME_PERIOD), Southbound: calc_avg_counts(distance_list[:vehicle_dist_morn_vs_eve][:Southbound], MORN_VS_EVE_TIME_PERIOD) },
     hour_dist_per_day: { Northbound: calc_avg_counts(distance_list[:vehicle_dist_per_hr][:Northbound], PER_HR_TIME_PERIOD), Southbound: calc_avg_counts(distance_list[:vehicle_dist_per_hr][:Southbound], PER_HR_TIME_PERIOD) },
     half_hour_dist_per_day: { Northbound: calc_avg_counts(distance_list[:vehicle_dist_per_half_hr][:Northbound], PER_HALF_HR_TIME_PERIOD), Southbound: calc_avg_counts(distance_list[:vehicle_dist_per_half_hr][:Southbound], PER_HALF_HR_TIME_PERIOD) },
     twenty_min_dist_per_day: { Northbound: calc_avg_counts(distance_list[:vehicle_dist_per_twenty_min][:Northbound], PER_TWENTY_MIN_TIME_PERIOD), Southbound: calc_avg_counts(distance_list[:vehicle_dist_per_twenty_min][:Southbound], PER_TWENTY_MIN_TIME_PERIOD) },
     fifteen_min_dist_per_day: { Northbound: calc_avg_counts(distance_list[:vehicle_dist_per_fifteen_min][:Northbound], PER_FIFTEEN_MIN_TIME_PERIOD), Southbound: calc_avg_counts(distance_list[:vehicle_dist_per_fifteen_min][:Southbound], PER_FIFTEEN_MIN_TIME_PERIOD) } }
  end

  def self.peak_volume_time_report(count_list)
    { morn_vs_eve_peak_time_per_day: { Northbound: calc_daily_peak_time(count_list[:vehicle_count_morn_vs_eve][:Northbound], MORN_VS_EVE_TIME_PERIOD), Southbound: calc_daily_peak_time(count_list[:vehicle_count_morn_vs_eve][:Northbound], MORN_VS_EVE_TIME_PERIOD) },
     hour_peak_time_per_day: { Northbound: calc_daily_peak_time(count_list[:vehicle_count_per_hr][:Northbound], PER_HR_TIME_PERIOD), Southbound: calc_daily_peak_time(count_list[:vehicle_count_per_hr][:Northbound], PER_HR_TIME_PERIOD) },
     half_hour_peak_time_per_day: { Northbound: calc_daily_peak_time(count_list[:vehicle_count_per_half_hr][:Northbound], PER_HALF_HR_TIME_PERIOD), Southbound: calc_daily_peak_time(count_list[:vehicle_count_per_half_hr][:Northbound], PER_HALF_HR_TIME_PERIOD) },
     twenty_min_peak_time_per_day: { Northbound: calc_daily_peak_time(count_list[:vehicle_count_per_twenty_min][:Northbound], PER_TWENTY_MIN_TIME_PERIOD), Southbound: calc_daily_peak_time(count_list[:vehicle_count_per_twenty_min][:Northbound], PER_TWENTY_MIN_TIME_PERIOD) },
     fifteen_min_peak_time_per_day: { Northbound: calc_daily_peak_time(count_list[:vehicle_count_per_fifteen_min][:Northbound], PER_FIFTEEN_MIN_TIME_PERIOD), Southbound: calc_daily_peak_time(count_list[:vehicle_count_per_fifteen_min][:Northbound], PER_FIFTEEN_MIN_TIME_PERIOD) } }
  end

  def self.total_vehicle_count(vehicle_list)
    vehicle_list.count
  end

  def self.group_by_time_period(vehicle_list, time_period_duration)
    vehicle_by_time = []
    time_period = nil
    cur_time_period = 0
    vehicle_list[0].each_cons(2) do |prev_vehicle, next_vehicle|
      if next_vehicle.first < prev_vehicle.first
        vehicle_by_time << time_period if !time_period.nil?
        cur_time_period = 0
        time_period = [[]]
      elsif next_vehicle.first > (cur_time_period + 1) * time_period_duration
        time_period = [[]] if time_period.nil?
        time_period[cur_time_period] << prev_vehicle if prev_vehicle != time_period[cur_time_period][0]
        while next_vehicle.first > (cur_time_period + 1) * time_period_duration
          cur_time_period += 1
          time_period[cur_time_period] = []
        end
        time_period[cur_time_period] << next_vehicle if next_vehicle != time_period[cur_time_period][0]
      else
        time_period = [[]] if time_period.nil?
        time_period[cur_time_period] << prev_vehicle if prev_vehicle != time_period[cur_time_period][0]
      end
    end
    time_period[cur_time_period] << vehicle_list[0].last
    vehicle_by_time << time_period
  end

  def self.vehicle_count(vehicle_list)
    vehicle_list.map do |vehicles|
      vehicles.map(&:size)
    end
  end

  def self.calculate_speed(start_time, end_time)
    (AVG_WHEEL_BASE / (end_time - start_time) * MSEC_TO_SEC).round(2)
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

  def self.calculate_distance(previous_car, next_car)
    next_car_speed = calculate_speed(next_car[0], next_car[1])
    time_in_sec = (next_car[0] - previous_car[0]) / MSEC_TO_SEC
    (next_car_speed * time_in_sec).round(2)
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

  def self.calc_avg_counts(vehicle_counts, duration)
    vehicle_counts.map do |vehicles|
      calculate_average(vehicles, duration)
    end
  end

  def self.calculate_average(counts, duration)
    msec_to_hours = duration / HRS_TO_MSEC
    total_duration = HRS_IN_A_DAY / msec_to_hours
    (counts.sum / total_duration).round(2)
  end

  def self.calc_peak_time(vehicle_counts)
    vehicle_counts.index(vehicle_counts.max)
  end

  def self.calc_daily_peak_time(vehicle_counts, duration)
    peak_time = []
    vehicle_counts.each do |vehicle|
      peak_time_start = (calc_peak_time(vehicle) * (duration / HRS_TO_MSEC)).round(2)
      peak_time << "#{peak_time_start} - #{(peak_time_start + duration / HRS_TO_MSEC).round(2) }"
    end
    peak_time
  end

  def self.parse_file
    FileParser.read_file('lib/stubs/Vehicle Survey Coding Challenge sample data.txt')
  end
end



