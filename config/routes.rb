Rails.application.routes.draw do

  root 'pages#home'
  get 'start' => 'start#index'
  get 'users/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/pages/about'
  get '/selected/random_item'
  get '/selected/random_restaurant'

  resources :users do
    resources :restaurants
  end

  resources :restaurants do
    resources :menus, only: [:index, :new, :create]
  end
  resources :menus, only: [ :show, :edit, :update, :destroy]

  resources :menus do
    resources :items, only: [:index, :new, :create, :random_item]
  end
  resources :items, only: [ :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
