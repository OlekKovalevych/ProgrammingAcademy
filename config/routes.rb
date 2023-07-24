Rails.application.routes.draw do
  root "hello#index"
  get "/greeting", to: "hello#greeting"
  resources :posts
  namespace :api do
    get '/weather_info', to: 'weather#weather_info'
    resources :posts, only: :show
  end
end
