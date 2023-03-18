# Use this file to easily define all of your cron jobs.

# Enable logging
set :output, 'log/cron.log'

# Enable Cron Jobs In Development
# set :environment, 'development'

# Daily Tasks
every :day, at: '6:00 PM' do
  runner 'ResultsAggregationService.daily_result_stats'
end

every :monday, at: '6:00 PM' do
  runner 'ResultsAggregationService.monthly_average_result_stats' if Time.now.week_of_month.eql?(3)
end
