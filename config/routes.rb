Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :commits, only: :create
    end
  end

  root "commits#index"
end
