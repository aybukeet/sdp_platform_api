Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # API namespace
  namespace :api do
    namespace :v1 do
      resources :users
      resources :scales
      resources :surveys
      resources :responses
      resources :analyses
    end
  end

  # Root route (API info)
  root to: proc { 
    [200, 
     { 'Content-Type' => 'application/json' }, 
     [{ 
       app: 'SDP Platform API',
       version: '1.0.0',
       endpoints: {
         users: '/api/v1/users',
         scales: '/api/v1/scales',
         surveys: '/api/v1/surveys',
         responses: '/api/v1/responses',
         analyses: '/api/v1/analyses'
       }
     }.to_json]
    ]
  }
end