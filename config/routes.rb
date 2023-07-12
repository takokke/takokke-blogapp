Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'    # get '/' => 'articles#index'　と一緒 
                               #articles.rbのindexメソッドを呼ぶ'
  resources :articles, only: [:show]
end
