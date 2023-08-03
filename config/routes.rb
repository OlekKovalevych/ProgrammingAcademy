require 'sidekiq/web'
require 'sidekiq/cron/web'


Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
  end
  
  root "hello#index"
  get "/chat_gpt", to: "hello#chat_gpt"
  get "/greeting", to: "hello#greeting"
  get "/rails_version", to: "hello#rails_version"
  post "/send_notification", to: "posts#send_notification"
  post "/hello", to: "hello#hello"
  resources :posts
  namespace :api do
    get '/weather_info', to: 'weather#weather_info'
    resources :posts, only: :show
  end
end
