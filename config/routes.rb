Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'homes#top'
  get '/home/about' => "homes#about"
  devise_for :users
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
  end
  get '/search', to: 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
