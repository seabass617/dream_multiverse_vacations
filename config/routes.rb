Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'components', to: 'components#sandbox'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dimensions, only: [ :index, :new, :create] do 
    resources :booking, only: [ :new, :create, :index,]
  end   
  get '/mybookings', to: 'bookings#my_index'
end
