Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#index"
  get "profile" => "users#profile"
  patch "update_profile" => "users#update_profile"
  get "change_password" => "users#change_password"
  patch "update_password" => "users#update_password"
  get "purchase_history" => "users#purchase_history"

  namespace :dashboard do
    resources :categories
  end
end
