# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources 'orders', only: %i[index show]
  post 'orders/upload'

  root to: 'orders#index'
end
