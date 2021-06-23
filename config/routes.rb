Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get '/', to: redirect('/api-docs')

  namespace :api do
    namespace :v1 do
      resources :players, only: [:create, :index] do
        get :impact_report, on: :collection
      end

      resources :scores, only: [:create, :index] do
        post :weekly_summary, on: :collection
      end
    end
  end
end
