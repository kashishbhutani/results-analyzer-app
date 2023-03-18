class ResultsAggregationService
  # Constants
  MONTHLY_MINIMUM_RESULT_COUNT = 200
  MONTHLY_MINIMUM_DAYS_COUNT = 5

  # Class Level Methods
  class << self
    def daily_result_stats
      daily_results_data = ResultsData.where('DATE(timestamp) >= ?', Date.today).group_by(&:subject)

      return unless daily_results_data.present?

      daily_results_data.each do |subject, data|
        create_daily_result_stat(data, subject)
      end
    end

    def monthly_average_result_stats
      min_date = MONTHLY_MINIMUM_DAYS_COUNT.days.ago.to_date
      monthly_results_data = DailyResultStat.where('date BETWEEN ? AND ?', min_date, Date.today)
                                            .group_by(&:subject)

      return unless monthly_results_data.present?

      monthly_results_data.each do |subject, data|
        process_monthly_results_data(subject, data, min_date)
      end
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

    def monthly_average__obj(data, subject)
      {
        subject: subject,
        monthly_avg_low: data.map(&:daily_low).min,
        monthly_avg_high: data.map(&:daily_high).max,
        monthly_result_count_used: data.map(&:result_count).sum,
        date: Date.today.to_s
      }
    end

    def monthly_result_count_satisfied?(data)
      data.map(&:result_count).sum >= MONTHLY_MINIMUM_RESULT_COUNT
    end

    def process_monthly_results_data(subject, data, min_date)
      if monthly_result_count_satisfied?(data)
        create_monthly_average_data(data, subject)
      else
        min_date = min_date - 1
        data = DailyResultStat.where('date BETWEEN ? AND ?', min_date, Date.today)
        process_monthly_results_data(subject, data, min_date)
      end
    end

    def create_monthly_average_data(data, subject)
      monthly_average = MonthlyAverage.new(monthly_average__obj(data, subject))

      if monthly_average.save
        puts "Monthly Average Data Saved Succcessfully For Subject #{subject}"
      else
        puts "Unable To Save Monthly Average Data For Subject #{subject}"
      end
    end

    def create_daily_result_stat(data, subject)
      daily_result_stat = DailyResultStat.new(daily_result_stat_obj(data, subject))

      if daily_result_stat.save
        puts "Daily Results Data Saved Succcessfully For Subject #{subject}"
      else
        puts "Unable To Save Daily Results Data For Subject #{subject}"
      end
    end
  end
end
