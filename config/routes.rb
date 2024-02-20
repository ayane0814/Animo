Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  
  namespace :admin do
    root to: "homes#top"
    resources :posts, only: [:show, :destroy]
    resources :comments, only: [:destroy]
    resources :users, only: [:index, :show, :edit, :update]
    get "search" => "searches#search"
    get "tagsearch" => "tagsearches#search"
  end
  
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :users, param: :name, only: [:show, :edit, :update] do
      member do
        get "laughed_posts"
        get "follows_show"
      end
      collection do
        patch "withdraw"
      end
    end
    resources :posts do
      collection do
        get "draft"
      end
      resources :comments, only: [:create, :destroy]
      resource :laughed_buttons, only: [:create, :destroy]
    end
    resources :follows, only: [:index, :create, :destroy]
    resources :notifications, only: :index
    get 'search' => "searches#search"
    get "tagsearch" => "tagsearches#search"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
