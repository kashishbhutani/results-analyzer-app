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

      daily_result_stat = DailyResultStat.last

      expect(DailyResultStat.count).to eq(1)
      expect(daily_result_stat.result_count).to eq(3)
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
    # Preparing the data
    let!(:daily_result_stats_one) { FactoryBot.create(:daily_result_stats_one) }
    let!(:daily_result_stats_two) { FactoryBot.create(:daily_result_stats_two) }
    let!(:daily_result_stats_three) { FactoryBot.create(:daily_result_stats_three) }

    it "should calculate the monthly average data if there's daily results stats data present" do
      result = ResultsAggregationService.monthly_average_result_stats

      expect(result).not_to be_empty
      expect(result['Science'].count).to eq(3)

      monthly_avg = MonthlyAverage.last

      expect(MonthlyAverage.count).to eq(1)
      expect(monthly_avg.monthly_result_count_used).to eq(
        daily_result_stats_one.result_count + daily_result_stats_two.result_count + daily_result_stats_three.result_count
      )
    end

    it "should not calculate the monthly average data if there's no daily results stats data present" do
      # Deleting all the Daily Result Stats records
      DailyResultStat.delete_all

      result = ResultsAggregationService.monthly_average_result_stats

      expect(result).to be_nil
      expect(MonthlyAverage.count).to eq(0)
    end
  end
end
