Rails.application.routes.draw do

  devise_for :users
  get 'static_pages/thankyou'
  root 'locations#index'
  resources :locations do
    resources :customers
  end


end
