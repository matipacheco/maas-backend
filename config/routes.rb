# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :weeks, only: [:index] do
        member do
          get 'availabilities'
        end
      end

      resources :services, only: [:index]
      resources :employees, only: [:index]

      put '/availabilities/:week_id/:service_id' => 'availabilities#update'
      get '/monitoring_shifts/:week_id/:service_id' => 'monitoring_shifts#show'
    end
  end
end
