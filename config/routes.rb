Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      get "/users", to: "users#index", as: :users
      get "/users/:user_name", to: "users#show", as: :user
    end
  end
end
