Rails.application.routes.draw do
  get 'login' => 'sessions/new'
  post 'login' => 'sessions/create' 
  post 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'

  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
