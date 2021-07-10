Rails.application.routes.draw do
  root to: 'orders#new'
  resources :orders, except: %i[patch update edit]
end
