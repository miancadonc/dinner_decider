Rails.application.routes.draw do
  
  get 'recipe_tags/new'
  get 'recipe_tags/create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create' 
  delete 'logout' => 'sessions#destroy'
  root 'static#home'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'signup' => 'users#new'

  get '/users/:user_id/random_recipes' => 'users#random_recipes', :as => 'random_recipes'
  get '/users/:user_id/browse_by_tag' => 'users#browse_by_tag', :as => 'browse_by_tag'
  get '/users/:user_id/browse_by_ingredient' => 'users#browse_by_ingredient', :as => 'browse_by_ingredient'


  resources :users do
    resources :recipes do
      resources :recipe_tags, only: [:new, :create]
    end
  end

  resources :ingredients

  resources :tags, only: [:create, :new]
  resources :recipe_ingredients, only: [:create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
