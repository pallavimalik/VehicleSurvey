require 'spec_helper'

describe ReportsController do
  it 'should render vehicle count in each direction template' do
    get :vehicle_count_by_direction, format: :pdf

    response.should be_success
    response.should render_template('vehicle_count_by_direction')
  end

  it 'should render peak volume times template' do
    get :peak_volume_times, format: :pdf

    response.should be_success
    response.should render_template('peak_volume_times')
  end

  it 'should render traffic speed distribution template' do
    get :traffic_speed_distribution, format: :pdf

    response.should be_success
    response.should render_template('traffic_speed_distribution')
  end

  it 'should render distance between cars template' do
    get :distance_between_cars, format: :pdf

    response.should be_success
    response.should render_template('distance_between_cars')
  end

end
