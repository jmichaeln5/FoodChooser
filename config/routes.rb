Rails.application.routes.draw do

  resources :items
  resources :menus
  resources :restaurants
  root 'pages#home'
  get 'pages/about'
  get 'selected/random_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
