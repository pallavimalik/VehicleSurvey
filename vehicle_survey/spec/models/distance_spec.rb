require 'spec_helper'

describe Distance do

  describe 'distance calculator' do
    it 'should return distance between vehicles' do
      previous_car_time = [98186, 98333]
      next_car_time = [499718, 499886]

      actual_distance = Distance.calculate_distance(previous_car_time, next_car_time)
      expected_distance = 5966.88
      actual_distance.should == expected_distance
    end

    it 'should calculate the average distance between vehicles' do
      vehicle_list = [[98186, 98333], [499718, 499886], [1016488, 1016648]]

      actual_distance = Distance.calculate_average_distance(vehicle_list)
      expected_distance = 7015.98
      actual_distance.should == expected_distance
    end

    it 'should calculate distance for a given time period' do
      vehicle_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648]], [[70511790, 70511910]]], [[[582668, 582789], [638379, 638520], [638700, 638900]]]]

      actual_list = Distance.calc_dist_by_time_period vehicle_list
      expected_list = [[7015.98, 0], [487.58]]
      actual_list.should == expected_list
    end
  end
end
