class ResultsAggregationService
  class << self
    def daily_result_stats
      daily_results_data = ResultsData.where('DATE(timestamp) >= ?', Date.today).group_by(&:subject)

      return unless daily_results_data.present?

      daily_results_data.each do |subject, data|
        daily_result_stat = DailyResultStat.new(daily_result_stat_obj(data, subject))

        if daily_result_stat.save
          puts "Daily Results Data Saved Succcessfully For Subject #{subject}"
        else
          puts "Unable To Save Daily Results Data For Subject #{subject}"
        end
      end
    end

    def monthly_result_stats
    end

    private

    def daily_result_stat_obj(data, subject)
      {
        subject: subject,
        daily_low: data.map(&:marks).min,
        daily_high: data.map(&:marks).max,
        result_count: data.count,
        date: Date.today.to_s
      }
    end
  end
end
