Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome" => "welcome#index"
  root "posts#index"
  resources :posts
  resources :categories
end
