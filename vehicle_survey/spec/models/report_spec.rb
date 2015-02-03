require 'spec_helper'
require 'pry'
describe Report do

  describe 'vehicle count' do
    it 'should return the vehicle count' do
      vehicle_list = [[98186, 98333],
                      [499718, 499886],
                      [1016488, 1016648],
                      [2146213, 2146349],
                      [2211004, 2211128],
                      [2695213, 2695369],
                      [3318189, 3318355],
                      [7051179, 7051310]]
      actual_count = Report.total_vehicle_count vehicle_list
      actual_count.should == 8
    end

    it 'should return a list of vehicle in the given time duration per day' do
      time_period = 12 * 60 * 60 * 1000
      vehicle_list = [[[98186, 98333],
                       [499718, 499886],
                       [1016488, 1016648],
                       [2146213, 2146349],
                       [2211004, 2211128],
                       [2695213, 2695369],
                       [33181890, 33181920],
                       [70511790, 70511910],
                       [582668, 582789],
                       [638379, 638520],
                       [638700, 638900]]]

      actual_list = Report.group_by_time_period vehicle_list, time_period
      expected_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648], [2146213, 2146349], [2211004, 2211128], [2695213, 2695369], [33181890, 33181920]], [[70511790, 70511910]]],
                       [[[582668, 582789], [638379, 638520], [638700, 638900]]]]
      actual_list.should == expected_list
    end

    it 'should return a list of vehicle in the given time duration per half hour' do
      time_period = 0.5 * 60 * 60 * 1000
      vehicle_list = [[[98186, 98333],
                       [499718, 499886],
                       [1016488, 1016648],
                       [2146213, 2146349],
                       [2211004, 2211128],
                       [2695213, 2695369],
                       [33181890, 33181920],
                       [70511790, 70511910],
                       [582668, 582789],
                       [638379, 638520],
                       [638700, 638900]]]

      actual_list = Report.group_by_time_period vehicle_list, time_period
      expected_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648]],
                        [[2146213, 2146349], [2211004, 2211128], [2695213, 2695369]],
                        [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],
                        [[33181890, 33181920]],
                        [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],
                        [[70511790, 70511910]]],
                       [[[582668, 582789], [638379, 638520], [638700, 638900]]]]
      actual_list.should == expected_list
    end

    it 'should return a list of vehicle in the given time duration per 20 min' do
      time_period = (20.0/60) * 60 * 60 * 1000
      vehicle_list = [[[98186, 98333],
                       [499718, 499886],
                       [1016488, 1016648],
                       [2146213, 2146349],
                       [2211004, 2211128],
                       [2695213, 2695369],
                       [33181890, 33181920],
                       [70511790, 70511910],
                       [582668, 582789],
                       [638379, 638520],
                       [638700, 638900]]]

      actual_list = Report.group_by_time_period vehicle_list, time_period
      expected_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648]],
                        [[2146213, 2146349], [2211004, 2211128]],
                        [[2695213, 2695369]],
                        [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],
                        [[33181890, 33181920]],
                        [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],
                        [[70511790, 70511910]]],
                       [[[582668, 582789], [638379, 638520], [638700, 638900]]]]
      actual_list.should == expected_list
    end

    it 'should return a list of vehicle in the given time duration per 15 min' do
      time_period = (15.0/60) * 60 * 60 * 1000
      vehicle_list = [[[98186, 98333],
                       [499718, 499886],
                       [1016488, 1016648],
                       [2146213, 2146349],
                       [2211004, 2211128],
                       [2695213, 2695369],
                       [33181890, 33181920],
                       [70511790, 70511910],
                       [582668, 582789],
                       [638379, 638520],
                       [638700, 638900]]]

      actual_list = Report.group_by_time_period vehicle_list, time_period
      expected_list = [[[[98186, 98333], [499718, 499886]],
                        [[1016488, 1016648]],
                        [[2146213, 2146349], [2211004, 2211128], [2695213, 2695369]],
                        [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],
                        [[33181890, 33181920]],
                        [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],
                        [[70511790, 70511910]]],
                       [[[582668, 582789], [638379, 638520], [638700, 638900]]]]
      actual_list.should == expected_list
    end

    it 'should give the total count of vehicles per time duration per day' do
      vehicle_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648], [2146213, 2146349], [2211004, 2211128], [2695213, 2695369], [33181890, 33181920]], [[70511790, 70511910]]], [[[582668, 582789], [638379, 638520], [638700, 638900]]]]

      actual_list = Report.vehicle_count vehicle_list
      expected_list = [[7, 1], [3]]
      actual_list.should == expected_list
    end

    it 'should give the average count of vehicles per session' do
      vehicle_counts = [[2, 1, 3, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 2, 13, 18, 13, 8, 18, 16, 44, 44, 49, 45, 46, 44, 35, 32, 23, 26, 29, 33, 25, 23, 26, 16, 35, 26, 33, 25, 30, 31, 27, 29, 24, 31, 26, 23, 28, 21, 42, 55, 44, 42, 41, 58, 93, 102, 80, 111, 114, 106, 19, 21, 27, 25, 9, 12, 11, 3, 7, 9, 9, 11, 8, 7, 12, 6, 10, 17, 7, 16, 9, 4, 4, 6]]

      session_duration = 15.0/60 * HRS_TO_MSEC
      average_count = Report.calc_avg_counts(vehicle_counts, session_duration)
      average_count.should == [22.8]
    end
  end

  describe 'speed calculations' do

    it 'should return the speed of a vehicle' do
      start_time = 268981
      end_time = 269123
      speed = Report.calculate_speed(start_time, end_time)

      speed.should == 17.61
    end

    it 'should calculate the average speed' do
      time = [[70511790, 70511910]]

      actual_speed = Report.calculate_average_speed(time)
      expected_speed = 20.83
      actual_speed.should == expected_speed
    end

    it 'should calculate speed for a given time period' do
      vehicle_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648], [2146213, 2146349], [2211004, 2211128], [2695213, 2695369], [33181890, 33181920]], [[70511790, 70511910]]], [[[582668, 582789], [638379, 638520], [638700, 638900]]]]

      actual_list = Report.calculate_speed_by_time_period vehicle_list
      expected_list = [[26.49, 20.83], [16.96]]
      actual_list.should == expected_list
    end
  end

  describe 'distance calculator' do
    it 'should return distance between vehicles' do
      previous_car_time = [98186, 98333]
      next_car_time = [499718, 499886]

      actual_distance = Report.calculate_distance(previous_car_time, next_car_time)
      expected_distance = 5966.88
      actual_distance.should == expected_distance
    end

    it 'should calculate the average distance between vehicles' do
      vehicle_list = [[98186, 98333], [499718, 499886], [1016488, 1016648]]

      actual_distance = Report.calculate_average_distance(vehicle_list)
      expected_distance = 7015.98
      actual_distance.should == expected_distance
    end

    it 'should calculate distance for a given time period' do
      vehicle_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648]], [[70511790, 70511910]]], [[[582668, 582789], [638379, 638520], [638700, 638900]]]]

      actual_list = Report.calc_dist_by_time_period vehicle_list
      expected_list = [[7015.98, 0], [487.58]]
      actual_list.should == expected_list
    end
  end

  describe 'peak volume time' do
    it 'should give the peak volume time' do
      vehicle_counts = [8, 3, 3, 6, 4, 5, 64, 132, 229, 97, 103, 86, 91, 101, 95, 185, 339, 373, 107, 53, 41, 40, 33, 23]

      peak_volume_time = Report.calc_peak_time vehicle_counts
      expected_time = 17
      peak_volume_time.should == expected_time
    end

    it 'should calculate the peak time per session duration' do
      vehicle_counts = [[7, 1, 2, 2, 2, 3, 52, 122, 184, 116, 110, 103, 119, 111, 98, 183, 294, 411, 92, 35, 36, 33, 50, 23],
                        [4, 1, 4, 3, 6, 5, 63, 123, 196, 122, 99, 101, 103, 91, 112, 192, 288, 394, 105, 39, 28, 49, 43, 22],
                        [4, 5, 1, 5, 6, 4, 63, 124, 178, 123, 108, 106, 100, 101, 108, 206, 288, 400, 87, 42, 43, 44, 36, 33],
                        [2, 8, 5, 10, 2, 3, 59, 142, 208, 132, 102, 89, 93, 101, 91, 214, 292, 412, 110, 44, 55, 32, 44, 24],
                        [8, 3, 3, 6, 4, 5, 64, 132, 229, 97, 103, 86, 91, 101, 95, 185, 339, 373, 107, 53, 41, 40, 33, 23]]

      duration = 1 * HRS_TO_MSEC

      peak_volume_time = Report.calc_daily_peak_time vehicle_counts, duration
      expected_time = ['17.0 - 18.0', '17.0 - 18.0', '17.0 - 18.0', '17.0 - 18.0', '17.0 - 18.0']
      peak_volume_time.should == expected_time
    end
  end
end
