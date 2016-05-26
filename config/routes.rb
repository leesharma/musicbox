Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :feedback, only: :create
      root to: 'static_pages#index'
    end
  end

  get '404' => 'errors#not_found'
  get '422' => 'errors#unprocessable_entity'
  get '500' => 'errors#internal_server_error'
end
