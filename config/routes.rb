Rails.application.routes.draw do
  root 'baskets#index'
  resources :baskets, except: [:destroy] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
