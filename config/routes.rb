Rails.application.routes.draw do

  resources :menus
  resources :restaurants
  root 'pages#home'

  get 'users/index'
  post 'sessions' => 'sessions#create'

  get 'logout' => 'sessions#destroy', :as => "logout"
  # delete 'logout' => 'sessions#destroy'
  # post 'users' => 'users#create'
  get 'dashboard' => 'users#dashboard', :as => "dashboard"
  #
  # get 'pages/home'

  get 'pages/about'
  # get '/pages/home', :as => "home"
  get '/selected/random_item'
  get '/selected/random_restaurant'

  resources :users
  resources :items

  get 'start' => 'start#index'

  # Nested resources example begin

  # resources :menus do
  #   resources :items
  # end

  # Nested resources example end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
