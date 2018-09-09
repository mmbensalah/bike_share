Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  
  resources :stations, only: [:index, :show], param: :slug

  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]
end
