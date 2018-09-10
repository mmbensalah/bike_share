Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/bike-shop', to: 'items#index'

  root 'welcome#index'
  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :stations, only: [:index, :show], param: :slug

  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]

  resources :carts, only: [:create]
  resources :users, only: [:new, :create]

  namespace :admin do
    resources :trips, only: [:show, :edit, :destroy, :new, :create, :update]
  end


end
