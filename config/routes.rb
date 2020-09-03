Rails.application.routes.draw do
  devise_for :users
  root to: "dimensions#index"
  get 'components', to: 'components#sandbox'
  resources :users, only: [:edit, :show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dimensions, only: [ :index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy]   
  get '/mybookings', to: 'bookings#index'

end
