Rails.application.routes.draw do
  resources :venues
  resources :events do
    put 'cancel', on: :member
    get 'movies', on: :member
    get 'attendees', to: 'events#show'
  end
  resources :movies, except: [:index, :show]
  get 'movies', to: 'home#movies'

  devise_for :users

  root to: "home#index"
end
