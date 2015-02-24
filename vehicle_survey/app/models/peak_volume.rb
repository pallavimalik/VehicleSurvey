class PeakVolume
  def self.peak_time(count_list, time_duration)
    {Northbound: calc_daily_peak_time(count_list[:vehicle_count_morn_vs_eve][:Northbound], time_duration),
     Southbound: calc_daily_peak_time(count_list[:vehicle_count_per_hr][:Southbound], time_duration)}
  end

  def self.calc_daily_peak_time(vehicle_counts, duration)
    peak_time = []
    vehicle_counts.each do |vehicle|
      peak_time_start = (calc_peak_time(vehicle) * (duration / HRS_TO_MSEC)).round(2)
      peak_time << "#{peak_time_start} - #{(peak_time_start + duration / HRS_TO_MSEC).round(2) }"
    end
    peak_time
  end

  def self.calc_peak_time(vehicle_counts)
    vehicle_counts.index(vehicle_counts.max)
  end
end