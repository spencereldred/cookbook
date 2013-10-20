Cookbook::Application.routes.draw do
  root :to => 'books#index'

  resources :books
  resources :ingredients
  resources :recipes
  resources :ingredient_recipes
  resources :users
  resources :sessions

  get '/logout' => "sessions#destroy"
  get '/login' => "sessions#new"

end
