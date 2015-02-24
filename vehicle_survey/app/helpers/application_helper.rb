module ApplicationHelper

  def self.group_by_period(vehicle_list)
    return group_vehicle(vehicle_list, MORN_VS_EVE_TIME_PERIOD),
      group_vehicle(vehicle_list, PER_FIFTEEN_MIN_TIME_PERIOD),
      group_vehicle(vehicle_list, PER_HALF_HR_TIME_PERIOD),
      group_vehicle(vehicle_list, PER_HR_TIME_PERIOD),
      group_vehicle(vehicle_list, PER_TWENTY_MIN_TIME_PERIOD)
  end

  def self.group_vehicle(vehicle_list, time_duration)
    {Northbound: (group_by_time_period [vehicle_list[0]], time_duration),
     Southbound: (group_by_time_period [vehicle_list[1]], time_duration)}
  end


  def self.group_by_time_period(vehicle_list, time_period_duration)
    vehicle_by_time = []
    time_period = nil
    cur_time_period = 0
    vehicle_list[0].each_cons(2) do |prev_vehicle, next_vehicle|
      if next_vehicle.first < prev_vehicle.first
        vehicle_by_time << time_period unless time_period.nil?
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

  def self.calculate_avg(vehicle_count_morn_vs_eve, vehicle_count_per_fifteen_min, vehicle_count_per_half_hr, vehicle_count_per_hr, vehicle_count_per_twenty_min)
    average_count_morn_vs_eve = calc_average(vehicle_count_morn_vs_eve, MORN_VS_EVE_TIME_PERIOD)
    average_count_per_hr = calc_average(vehicle_count_per_hr, PER_HR_TIME_PERIOD)
    average_count_per_half_hr = calc_average(vehicle_count_per_half_hr, PER_HALF_HR_TIME_PERIOD)
    average_count_per_fifteen_min = calc_average(vehicle_count_per_fifteen_min, PER_FIFTEEN_MIN_TIME_PERIOD)
    average_count_per_twenty_min = calc_average(vehicle_count_per_twenty_min, PER_TWENTY_MIN_TIME_PERIOD)

    return average_count_morn_vs_eve, average_count_per_fifteen_min, average_count_per_half_hr, average_count_per_hr, average_count_per_twenty_min
  end

  def self.calc_average(vehicle_list, time_duration)
    {Northbound: calc_avg_counts(vehicle_list[:Northbound], time_duration),
     Southbound: calc_avg_counts(vehicle_list[:Southbound], time_duration)}
  end

end