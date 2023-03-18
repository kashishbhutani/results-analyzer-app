Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # APIs To Store Result Data
      resources :results_data, only: [:create]

      # APIs To View Stored Result Data
      get 'daily_result_stats', to: 'results_data#daily_result_stats'
      get 'monthly_average_result_stats', to: 'results_data#monthly_average_result_stats'
    end
  end
end
