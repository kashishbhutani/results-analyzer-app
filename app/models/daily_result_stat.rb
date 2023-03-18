class DailyResultStat < ApplicationRecord
  validates_presence_of :subject, :date, :daily_low, :daily_high, :result_count
  validates_uniqueness_of :date, scope: %i[subject]
end
