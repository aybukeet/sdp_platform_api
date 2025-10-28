Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  devise_for :users, path: 'api/v1', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'api/v1/sessions',
      registrations: 'api/v1/registrations'
    }

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :users
      resources :scales
      resources :surveys
      resources :responses
      resources :analyses
    end

    namespace :v2 do
      resources :users, only: [:index, :show]
    end
  end

  root to: proc { 
    [200, 
     { 'Content-Type' => 'application/json' }, 
     [{ 
       app: 'SDP Platform API',
       version: '1.0.0',
       endpoints: {
         v1_users: '/api/v1/users',
         v2_users: '/api/v2/users',
         documentation: '/api-docs'
       }
     }.to_json]
    ]
  }
end