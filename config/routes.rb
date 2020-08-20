Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index' #トップページを表示させる
  resources :items, only: [:index, :new, :create]
end