Money::Application.routes.draw do
  root :to => 'home#index'
  resources :users
  resources :amounts
  resources :additions
  resources :sessions, :only => [:new, :create, :destroy]
  match '/signout', :to => 'sessions#destroy'
  match '/signin', :to => 'sessions#new'
end
