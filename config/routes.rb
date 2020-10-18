# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :weeks, only: [:index]
      resources :services, only: [:index]
      resources :employees, only: [:index]

      get '/monitoring_shifts/:id/availabilities' => 'monitoring_shifts#availabilities'
      put '/monitoring_shifts/:id/availabilities' => 'monitoring_shifts#update_availability'
      get '/monitoring_shifts/:week_id/:service_id' => 'monitoring_shifts#show'
    end
  end
end
