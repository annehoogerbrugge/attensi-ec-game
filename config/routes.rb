Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get '/', to: redirect('/api-docs')
  
  namespace :api do
    namespace :v1 do
      resources :players, only: [:create, :index]
      resources :scores, only: [:create, :index]
    end
  end
end
