Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        member do
          resources :friends
        end
      end

      post "/sleep_records", to: "sleep_records#create", as: :create_sleep_records
      patch "/sleep_records", to: "sleep_records#update", as: :update_sleep_record
    end
  end
end
