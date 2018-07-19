Rails.application.routes.draw do

  root 'pages#home'

  get 'users/index'
  post 'sessions' => 'sessions#create'
  get 'login' => 'sessions#new'

  get 'logout' => 'sessions#destroy', :as => "logout"
  # delete 'logout' => 'sessions#destroy'
  # post 'users' => 'users#create'
  get 'dashboard' => 'users#dashboard', :as => "dashboard"
  #
  # get 'pages/home'

  get 'pages/about'
  # get '/pages/home', :as => "home"
  get '/selected/random_item'

  resources :restaurants
  resources :menus
  resources :items
  resources :users


  # Nested resources example begin

  # resources :menus do
  #   resources :items
  # end

  # Nested resources example end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
