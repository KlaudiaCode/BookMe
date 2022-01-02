Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :items
  resources :users, except: :index
  get 'users/:id/shelf', to: 'users#shelf'
  post 'users/change_password', to: 'users#change_password'
  post 'trades/archive', to: 'trades#archive'
  post 'item/filter', to: 'items#change_filter'

  resources :trades, only: [:new, :create, :index, :update, :destroy]
  
end
