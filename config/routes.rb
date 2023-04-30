Rails.application.routes.draw do
  resources :stations, only: %w[index show] do
    resources :statuses, only: %w[index], controller: :station_statuses
  end
end
