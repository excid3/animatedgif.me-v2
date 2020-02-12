Rails.application.routes.draw do
  devise_for :users

  resources :gifs
  resources :users, only: [:index, :show]

  get '*tag', to: "gifs#random", as: :random_gif

  root to: "gifs#index"
end
