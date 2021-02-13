Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create' 
  delete 'logout' => 'sessions#destroy'
  root 'static#home'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'signup' => 'users#new'


  resources :users do
    resources :recipes
    resources :ingredients
  end

  resources :recipe_ingredients, only: [:create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
