Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"
  scope module: :public do
    get 'search' => 'books#search'
     delete "/books/:id/destroy" => "books#destroy", as: "destroy"
     delete "/books/destroy_all" => "books#destroy_all", as: "destroy_all"
   resources :books, only: [:show, :new, :index, :edit, :create]
     get "my_page" => "users#show", as: "my_page"
     get "/users/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
     patch "/users/withdraw" => "users#withdraw", as: "withdraw"
   resources :users, only: [:show, :edit, :update] do
      collection do
      get 'search'
    end
  end
     delete "/assessments/:id/destroy" => "assessments#destroy", as: "destroy_assessment"
   resources :assessments, only: [:new, :update, :create, :show]
   resources :posts, only: [:new]

  end

  namespace :admin do
    root to: "/homes#top"
    resources :users, only: [:show, :update, :index, :edit]
    resources :books, only: [:show, :new, :index, :edit]
    delete "/books/:id/destroy" => "books#destroy", as: "destroy"
    delete "/books/destroy_all" => "books#destroy_all", as: "destroy_all"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
