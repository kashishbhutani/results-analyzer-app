class MonthlyAverage < ApplicationRecord
  validates_presence_of :subject, :date, :monthly_avg_low, :monthly_avg_high, :monthly_result_count_used
end
