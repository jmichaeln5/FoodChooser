Rails.application.routes.draw do

  root 'pages#home'
  get 'users/index'
  post 'sessions' => 'sessions#create'

  get 'logout' => 'sessions#destroy', :as => "logout"
  # delete 'logout' => 'sessions#destroy'
  get 'dashboard' => 'users#dashboard', :as => "dashboard"
  get 'pages/about'
  get '/selected/random_item'
  get '/selected/random_restaurant'

  resources :users do
    resources :restaurants
  end
  resources :restaurants do
    resources :menus
  end

  # resources :menus
  resources :items

  get 'start' => 'start#index'

  # Nested resources example begin

  # resources :menus do
  #   resources :items
  # end

  # Nested resources example end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
