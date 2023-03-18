FactoryBot.define do
  factory :results_data do
    subject { Faker::Name.name }
    marks { 72.25 }
    timestamp { '2022-04-18 12:01:35.678' }
  end
end
