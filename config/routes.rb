Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :services, only: [:index]
      resources :employees, only: [:index]
    end
  end
end
