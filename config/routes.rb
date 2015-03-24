Rails.application.routes.draw do
  resources :items
  get 'items#admin'
  root 'items#index'
end
