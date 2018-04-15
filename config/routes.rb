Rails.application.routes.draw do
  root "home#index"

  resources :canvas

  get  "home/index"
  post "home/submit"
end
