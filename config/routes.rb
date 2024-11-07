Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  scope module: :public do
    devise_for :users

    root to: "homes#top"
    get "homes/about" => "homes#about", as: "about"
    get '/search', to: 'searches#search'

    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :choice, only: [:new, :create, :index, :show, :edit, :update] do
        resource :favorite, only: [:create, :destroy]
      end
       resources :comments, only: [:create]
    end

    resources :users, only: [:edit, :mypage, :update] do
      member do
        get :mypage
      end
    end
  end
end
