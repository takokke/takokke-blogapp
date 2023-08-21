Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:new, :create]

    # 複数形にするとurlでidを指定しなくてよくなる
    resource :like, only: [:create, :destroy]
  end

  # resourceのときは、show,edit,updateで作る時が多い
  resource :profile, only: [:show, :edit, :update]

  resources :favorites, only: [:index]
end
