Rails.application.routes.draw do

  root to: 'locations#index'
  resources :locations do
    resources :customers 
  end


end
