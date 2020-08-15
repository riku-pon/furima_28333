Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items
  post 'items', to: 'items#create'
end