Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users, :posts
  root to: "posts#index"
  mount Commontator::Engine => '/commontator'

end
