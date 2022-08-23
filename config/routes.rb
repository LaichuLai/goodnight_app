Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      get "/users", to: "users#index", as: :users
      get "/users/:name", to: "users#show", as: :user

      post "/sleep_records", to: "sleep_records#create", as: :create_sleep_records
      patch "/sleep_records", to: "sleep_records#update", as: :update_sleep_record
    end
  end
end
