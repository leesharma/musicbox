Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :feedback, only: :create
      root to: 'static_pages#index'
    end
  end
end
