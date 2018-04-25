Rails.application.routes.draw do
  resources :problem_sets, only: [:new, :edit, :create, :destroy]
  resources :challenges
  devise_for :user

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    get  "home/index"
    post "home/submit"
    get  "login",   to: "devise/sessions#new"
    post "login",   to: "devise/sessions#create"
    delete "logout",   to: "devise/sessions#destroy"
    
  end

  #root "home#index"
  resources :canvas
end
