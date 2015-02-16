Rails.application.routes.draw do
  root :to => 'application#show'

  resources :reports do
    collection do
      get :vehicle_count_by_direction
      get :peak_volume_times
      get :traffic_speed_distribution
      get :distance_between_cars
    end
  end
end
