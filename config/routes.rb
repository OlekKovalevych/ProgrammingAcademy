require 'sidekiq/web'
require 'sidekiq/cron/web'


Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app

  root "hello#index"
  get "/greeting", to: "hello#greeting"
  post "/send_notification", to: "posts#send_notification"
  post "/hello", to: "hello#hello"
  resources :posts
  namespace :api do
    resources :posts, only: :show
  end
end
