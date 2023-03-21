FactoryBot.define do
  factory :results_data_one, class: 'ResultsData' do
    subject { 'Science' }
    marks { 72.25 }
    timestamp { Date.today.to_s }
  end
  factory :results_data_two, class: 'ResultsData' do
    subject { 'Science' }
    marks { 89.25 }
    timestamp { Date.today.to_s }
  end
  factory :results_data_three, class: 'ResultsData' do
    subject { 'Science' }
    marks { 69.25 }
    timestamp { Date.today.to_s }
  end
  factory :daily_result_stats_one, class: 'DailyResultStat' do
    date { Date.today.to_s }
    subject { 'Science' }
    daily_low { 119.88 }
    daily_high { 126.76 }
    result_count { 81 }
  end
  factory :daily_result_stats_two, class: 'DailyResultStat' do
    date { Date.yesterday.to_s }
    subject { 'Science' }
    daily_low { 123.73 }
    daily_high { 127.23 }
    result_count { 57 }
  end
  factory :daily_result_stats_three, class: 'DailyResultStat' do
    date { (Date.yesterday - 1).to_s }
    subject { 'Science' }
    daily_low { 120.27 }
    daily_high { 123.33 }
    result_count { 75 }
  end
end
