require 'spec_helper'
describe PeakVolume do
  describe 'peak volume time' do
    it 'should give the peak volume time' do
      vehicle_counts = [8, 3, 3, 6, 4, 5, 64, 132, 229, 97, 103, 86, 91, 101, 95, 185, 339, 373, 107, 53, 41, 40, 33, 23]

      peak_volume_time = PeakVolume.calc_peak_time vehicle_counts
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

      peak_volume_time = PeakVolume.calc_daily_peak_time vehicle_counts, duration
      expected_time = ['17.0 - 18.0', '17.0 - 18.0', '17.0 - 18.0', '17.0 - 18.0', '17.0 - 18.0']
      peak_volume_time.should == expected_time
    end
  end

end
