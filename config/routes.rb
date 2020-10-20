Rails.application.routes.draw do

  get 'static_pages/thankyou'
  root 'locations#index'
  resources :locations do
    resources :customers 
  end


end
