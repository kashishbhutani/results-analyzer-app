# README
- Result Analyzer App
### OVERVIEW:

  Application works with test results and performs end of day (EOD) and Monthly Calculations. Please see below some impportant facts about the app:

  - Students give online tests
  - A third_party service MSM, submits the test results to the rails app when a test is submitted by a student
  - We store these test results
  - Every day at 6PM, our app performs the following EOD tasks:
    - Aggregates all the collected results for a day and calculates "Daily Result Stats" (explained below).
    - If today is Monday of week of third Wednessday then it calculates "Monthly Result Averages" too (explained below).

### Technical Details:

* Ruby version - 3.0.1

* Rails version - 7.0.4.3

* System Dependencies - bundle install

* Database Creation - rails db:setup && rails db:migrate

* How to run the rspec test suite - rspec

* How to run the cucumber test suite - cucumber or bundle exec cucumber

* How to run the server - rails s

* How to run the console - rails c

* How to write CronJob into CronTab - whenever --update-crontab

* How to list CronJobs present in CronTab -  crontab -l

* How to remove CronJob from CronTab -  crontab -r

* How to run CronJob directly without updating in CronTab 
  - bundle exec bin/rails runner -e development 'ResultsAggregationService.daily_result_stats'
  - bundle exec bin/rails runner -e development 'ResultsAggregationService.monthly_average_result_stats'
