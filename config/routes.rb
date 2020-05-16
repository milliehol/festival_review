Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  delete '/session/', to: 'session#destroy'

  resources :reviews
  resources :festivals
  resources :cities
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
