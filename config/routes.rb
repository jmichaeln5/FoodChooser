Rails.application.routes.draw do

  root 'items#index'

  get 'users/index'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  get '/dashboard' => 'users#dashboard'
  #
  # get 'pages/home'

  get 'pages/about'
  get 'pages/home'
  get 'selected/random_item'

  resources :restaurants
  resources :menus
  resources :items



  # Nested resources example begin

  # resources :menus do
  #   resources :items
  # end

  # Nested resources example begin




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
