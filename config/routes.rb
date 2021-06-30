Rails.application.routes.draw do
  
  get "/", to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, :except => [:index, :new, :create] do
    resources :relationships, only: [:create, :destroy]
  end
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :places, :except => [:new]
  
  resources :articles do
    resource :likes,only:[:create,:destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  get "search", to: "searchs#search"
  get "sort", to: "sorts#sort"
end
