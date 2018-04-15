Rails.application.routes.draw do
  resources :challenges
  devise_for :users
  root "home#index"

  get "home/index"
  post "home/submit"
end
