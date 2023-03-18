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

* Database Creation - rails db:setup

* How to run the test suite - rspec

* How to run the server - rails s
