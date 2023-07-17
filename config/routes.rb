Rails.application.routes.draw do
  root "hello#index"
  get "/greeting", to: "hello#greeting"
  resources :posts
  namespace :api do
    resources :posts, only: :show
  end
end
