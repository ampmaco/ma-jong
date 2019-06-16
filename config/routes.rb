Rails.application.routes.draw do
  devise_for :users
  root :to => "posts#index"
  get 'top/concept' => 'top#concept', as: 'concept'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
  	resource :user_posts, only: [:create, :destroy]
  end
  resources :user_posts, only: [:index]

end
