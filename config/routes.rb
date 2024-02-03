Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    root to: "homes#top"
    resources :posts, only: [:show, :destroy]
    resources :comments, only: [:destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end
  
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    get "/my_page", to: "users#show", as: "show_user"
    get "/information/edit", to: "users#edit", as: "edit_user"
    patch "/information", to: "users#update", as: "user"
    resources :users, except: [:new, :create, :index, :show, :edit, :update, :destroy] do
      collection do
        patch "withdraw"
      end
    end
    resources :posts do
      collection do
        get "draft"
      end
    end
    resources :laughed_buttons, only: [:index, :create, :destroy]
    resources :follows, only: [:index, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
