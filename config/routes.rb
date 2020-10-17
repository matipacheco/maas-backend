Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :weeks, only: [:index]
      resources :services, only: [:index]
      resources :employees, only: [:index]
    end
  end
end
