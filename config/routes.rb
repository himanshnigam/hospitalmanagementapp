Rails.application.routes.draw do

  resources :doctors, only: [:index, :show, :create]

  resources :users
  
  post '/auth/login', to: 'authentication#login'
  
  post '/auth/signup', to: 'authentication#signup'

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:index, :create]
  end

  resources :notifications, only: [:index] do
    patch :mark_as_read, on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
