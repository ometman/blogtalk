Rails.application.routes.draw do
  devise_for :users

 devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :login
  end

  root to: 'home#index'
  
  resources :users, only: [:index, :show, :new, :create] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end
end
