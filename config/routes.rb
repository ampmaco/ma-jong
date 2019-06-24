Rails.application.routes.draw do
  # devise用のルーティング
  devise_for :users

  # トップページのルーティング
  root :to => "posts#index"

  # コンセプトページ
  get 'top/concept' => 'top#concept', as: 'concept'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ユーザーマイページにユーザーコメントをネスト
  resources :users, only: [:show, :edit, :update] do
    resource :comments, only: [:create]
  end

  # 投稿にグループ追加テーブルとグループのチャットページをネスト
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
  	resource :user_posts, only: [:create, :destroy]
    resource :messages, only: [:create]
    # :messagesテーブルのネストresourceで:indexが反応しない為記述
    get 'messages' => 'messages#index', as: 'message'
  end
  resources :user_posts, only: [:index]
  resources :comments, only: [:destroy]
  resources :messages, only: [:destroy]
  resources :contacts, only: [:index, :create, :destroy]

  # 管理者ページのルーティング
  namespace :administrator do
    resources :users, only: [:index]
    get 'posts' => 'users#posts', as: 'posts'
    get 'comments' => 'users#comments', as: 'comments'
    get 'contacts' => 'users#contacts', as: 'contacts'
  end
end
