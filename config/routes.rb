Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"

  resources :posts, only: [:new, :create, :index, :show, :edit, :update]
  resources :users, only: [ :edit, :mypage] do
    member do
      get :mypage
    end
  resources :choice, only: [:new, :create, :index, :show, :edit, :update]
  end
  end
