# frozen_string_literal: true

RSpec.describe ResultsAggregationService do
  context 'daily_result_stats' do
    # Preparing the data
    let!(:results_data_one) { FactoryBot.create(:results_data_one) }
    let!(:results_data_two) { FactoryBot.create(:results_data_two) }
    let!(:results_data_three) { FactoryBot.create(:results_data_three) }

    it "should calculate the daily results stats if there's results data present" do
      result = ResultsAggregationService.daily_result_stats

      expect(result).not_to be_empty
      expect(result['Science'].count).to eq(3)
      expect(DailyResultStat.count).to eq(1)
    end

    it "should not calculate the daily results stats if there's no results data present" do
      # Deleting all the results_data records
      ResultsData.delete_all

      result = ResultsAggregationService.daily_result_stats

      expect(result).to be_nil
      expect(DailyResultStat.count).to eq(0)
    end
  end

  context 'monthly_average_result_stats' do
  end
end
