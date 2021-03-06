Rails.application.routes.draw do
  use_doorkeeper
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      get "/current_director" => "directors#show"

      get "/current_actor" => "actors#show"

      resources :roles

      resources :actors

      resources :directors

      resources :movies
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "movies#index"
  resources :roles
  devise_for :actors
  resources :actors
  devise_for :directors
  resources :directors
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
