require 'rails_helper'

describe MonthlyAverage do
  context 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:monthly_avg_low) }
    it { should validate_presence_of(:monthly_avg_high) }
    it { should validate_presence_of(:monthly_result_count_used) }
  end
end
