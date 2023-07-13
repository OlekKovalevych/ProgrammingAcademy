Rails.application.routes.draw do
  root "hello#index"

  get '/greeting', to: "hello#greeting"
end
