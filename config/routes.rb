Rails.application.routes.draw do
  resources :venues
  resources :movies

  devise_for :users

  root to: "venues#index"
end
