Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "movies#index"
  resources :roles
  devise_for :actors
  resources :actors
  devise_for :directors
  resources :directors
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
