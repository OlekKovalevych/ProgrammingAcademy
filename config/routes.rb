Rails.application.routes.draw do
  root "hello#index"
  get "/greeting", to: "hello#greeting"
  post "/send_notification", to: "posts#send_notification"
  resources :posts
  namespace :api do
    resources :posts, only: :show
  end
end
