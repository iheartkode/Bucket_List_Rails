Rails.application.routes.draw do
  get 'index/index'

  devise_for :users
  resources :items
  root 'index#index'
end
