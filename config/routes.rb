Rails.application.routes.draw do
  resources :roles
  devise_for :actors
  resources :actors
  devise_for :directors
  resources :directors
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
