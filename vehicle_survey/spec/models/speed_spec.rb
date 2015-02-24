require 'spec_helper'
describe Speed do
  describe 'speed calculations' do

    it 'should return the speed of a vehicle' do
      start_time = 268981
      end_time = 269123
      speed = Speed.calculate_speed(start_time, end_time)

      speed.should == 17.61
    end

    it 'should calculate the average speed' do
      time = [[70511790, 70511910]]

      actual_speed = Speed.calculate_average_speed(time)
      expected_speed = 20.83
      actual_speed.should == expected_speed
    end

    it 'should calculate speed for a given time period' do
      vehicle_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648], [2146213, 2146349], [2211004, 2211128], [2695213, 2695369], [33181890, 33181920]], [[70511790, 70511910]]], [[[582668, 582789], [638379, 638520], [638700, 638900]]]]

      actual_list = Speed.calculate_speed_by_time_period vehicle_list
      expected_list = [[26.49, 20.83], [16.96]]
      actual_list.should == expected_list
    end
  end

end