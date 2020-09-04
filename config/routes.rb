Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  root to: "dimensions#index"
  get 'components', to: 'components#sandbox'
  get 'listings', to: 'dimensions#listings'
  get '/users/:id', to: "users#show", as: "user"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :dimensions, only: [ :index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy]   
  get '/mybookings', to: 'bookings#index'

end
