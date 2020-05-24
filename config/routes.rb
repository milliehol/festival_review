Rails.application.routes.draw do

  root 'sessions#welcome'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  delete '/logout/', to: 'sessions#destroy', as: "logout"

  #get '/festival', to: 'festivals#show', as: 'festivals'
  #get '/city', to: 'cities#show', as: 'cities'

  resources :reviews

  resources :festivals do
    resources :reviews, only: [:new, :index]
  end

  resources :reviews
  resources :cities
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
