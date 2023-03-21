FactoryBot.define do
  factory :results_data_one, class: 'ResultsData' do
    subject { 'Science' }
    marks { 72.25 }
    timestamp { DateTime.now.to_s }
  end
  factory :results_data_two, class: 'ResultsData' do
    subject { 'Science' }
    marks { 89.25 }
    timestamp { DateTime.now.to_s }
  end
  factory :results_data_three, class: 'ResultsData' do
    subject { 'Science' }
    marks { 69.25 }
    timestamp { DateTime.now.to_s }
  end
end
