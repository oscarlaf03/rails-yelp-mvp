Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [ :index, :new, :create ]
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  root to: 'restaurants#index'
end
