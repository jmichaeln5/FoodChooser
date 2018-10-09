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

  # resources :users
  # resources :restaurants
  # resources :menus
  # resources :items

  resources :users do
    resources :restaurants
  end

  resources :restaurants do
    resources :menus
  end


  # resources :restaurants do
  #   resources :menus do
  #     resources :items
  #   end
  # end

  resources :menus do
    resources :items
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
