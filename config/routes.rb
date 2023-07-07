Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # get '/' => 'home#index'      #home_controllerのindexメソッドを呼び出す
  get '/about' => 'home#about' #home_controllerのaboutメソッドを呼び出す
end
