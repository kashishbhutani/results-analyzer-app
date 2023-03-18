Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :results_data, only: [:create]
      get 'daily_result_stats', to: 'results_data#daily_result_stats'
    end
  end
end
