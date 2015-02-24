class Vehicle
  def self.total_vehicle_count(vehicle_list)
    vehicle_list.count
  end

  def self.calculate_count(vehicle_morn_vs_eve, vehicle_per_fifteen_min, vehicle_per_half_hr, vehicle_per_hr, vehicle_per_twenty_min)
    vehicle_count_per_hr = {Northbound: vehicle_count(vehicle_per_hr[:Northbound]), Southbound: vehicle_count(vehicle_per_hr[:Southbound])}
    vehicle_count_per_half_hr = {Northbound: vehicle_count(vehicle_per_half_hr[:Northbound]), Southbound: vehicle_count(vehicle_per_half_hr[:Southbound])}
    vehicle_count_per_twenty_min = {Northbound: vehicle_count(vehicle_per_twenty_min[:Northbound]), Southbound: vehicle_count(vehicle_per_twenty_min[:Southbound])}
    vehicle_count_per_fifteen_min = {Northbound: vehicle_count(vehicle_per_fifteen_min[:Northbound]), Southbound: vehicle_count(vehicle_per_fifteen_min[:Southbound])}
    vehicle_count_morn_vs_eve = {Northbound: vehicle_count(vehicle_morn_vs_eve[:Northbound]), Southbound: vehicle_count(vehicle_morn_vs_eve[:Southbound])}
    return vehicle_count_morn_vs_eve, vehicle_count_per_fifteen_min, vehicle_count_per_half_hr, vehicle_count_per_hr, vehicle_count_per_twenty_min
  end

  def self.vehicle_count(vehicle_list)
    vehicle_list.map do |vehicles|
      vehicles.map(&:size)
    end
  end
end