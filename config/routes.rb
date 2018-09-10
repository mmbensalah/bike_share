Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :stations, only: [:index, :show], param: :slug

  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]

  resources :users, only: [:new, :create]

  namespace :admin do
    resources :trips, only: [:show]
  end

end
