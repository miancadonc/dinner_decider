Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create' 
  delete 'logout' => 'sessions#destroy'
  root 'static#home'

  get 'signup' => 'users#new'

  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
