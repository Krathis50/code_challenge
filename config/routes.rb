Rails.application.routes.draw do
  resources :problem_sets, only: [:new, :edit, :create, :destroy]
  resources :challenges do
    post "submit" => "challenges#submit"
  end
  devise_for :users
  root "home#index"

  get "home/index"
  post "home/submit"
end
