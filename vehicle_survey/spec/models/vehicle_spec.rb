require 'spec_helper'
describe Vehicle do
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
      actual_count = Vehicle.total_vehicle_count vehicle_list
      actual_count.should == 8
    end

    it 'should give the total count of vehicles per time duration per day' do
      vehicle_list = [[[[98186, 98333], [499718, 499886], [1016488, 1016648], [2146213, 2146349], [2211004, 2211128], [2695213, 2695369], [33181890, 33181920]], [[70511790, 70511910]]], [[[582668, 582789], [638379, 638520], [638700, 638900]]]]

      actual_list = Vehicle.vehicle_count vehicle_list
      expected_list = [[7, 1], [3]]
      actual_list.should == expected_list
    end
  end

end