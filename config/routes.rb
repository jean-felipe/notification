Rails.application.routes.draw do
  resources :notifications
  devise_for :users
  
  root 'notifications#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end