# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :weeks, only: [:index]
      resources :services, only: [:index]
      resources :employees, only: [:index]

      get '/monitoring_shifts/:id/availabilities' => 'monitoring_shifts#availabilities'
      get '/monitoring_shifts' => 'monitoring_shifts#show'
      put '/monitoring_shifts/:id/availabilities' => 'monitoring_shifts#update_availability'
      put '/monitoring_shifts/:id' => 'monitoring_shifts#update'
    end
  end
end
