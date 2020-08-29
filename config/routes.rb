Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index' #トップページを表示させる
  resources :items do
    resources :orders, only: [:index, :create]
  end
end