Rails.application.routes.draw do
  devise_for :users
  resources :cronies
  resources :friends
  #get 'home/index'
  root 'cronies#index'
  get 'home/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
