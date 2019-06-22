Rails.application.routes.draw do
  devise_for :users
  root :to => "posts#index"
  get 'top/concept' => 'top#concept', as: 'concept'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update] do
    resource :comments, only: [:create]
  end
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
  	resource :user_posts, only: [:create, :destroy]
    resource :messages, only: [:create]
    # :messagesテーブルのネストresourceで:indexが反応しない為記述
    get 'messages' => 'messages#index', as: 'message'
  end
  resources :user_posts, only: [:index]
  resources :comments, only: [:edit, :update, :destroy]
  resources :messages, only: [:edit, :update, :destroy]
  resources :contacts, only: [:index, :create]

  namespace :administrator do
    resources :users, only: [:index]
    get 'posts' => 'users#posts', as: 'posts'
    get 'comments' => 'users#comments', as: 'comments'
  end
end
