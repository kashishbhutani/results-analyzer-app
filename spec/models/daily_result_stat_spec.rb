require 'rails_helper'

describe DailyResultStat do
  context 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:daily_low) }
    it { should validate_presence_of(:daily_high) }
    it { should validate_presence_of(:result_count) }
    it { should validate_uniqueness_of(:date).scoped_to(:subject) }
  end
end
