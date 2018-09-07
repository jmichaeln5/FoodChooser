Rails.application.routes.draw do

  # resources :users
  # resources :restaurants
  # resources :menus
  # resources :items

  get 'start' => 'start#index'

  root 'pages#home'
  get 'users/index'
  post 'sessions' => 'sessions#create'

  get 'logout' => 'sessions#destroy', :as => "logout"
  # delete 'logout' => 'sessions#destroy'
  get 'pages/about'
  get '/selected/random_item'
  get '/selected/random_restaurant'

  resources :users
  resources :restaurants

  resources :restaurants do
    resources :menus
  end


  resources :menus do
    resources :items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
