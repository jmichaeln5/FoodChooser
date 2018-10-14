Rails.application.routes.draw do

  get 'start' => 'start#index'

  root 'pages#home'
  get 'users/index'
  post 'sessions' => 'sessions#create'

  get 'logout' => 'sessions#destroy', :as => "logout"
  # delete 'logout' => 'sessions#destroy'
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
