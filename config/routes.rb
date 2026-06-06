Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"

  get "dashboard", to: "dashboard#index"
  get "bible", to: "bible#index"
  get "groups", to: "groups#index"
  get "tasks", to: "tasks#index"
  get "profile", to: "profile#index"

  resources :notices
  resources :prayer_requests
  resources :tasks do
    member do
      patch :complete
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end