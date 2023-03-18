class Api::V1::ResultsDataController < ApplicationController
  # POST /api/v1/results_data
  def create
    result_data = ResultsData.new(result_data_params)

    if result_data.save
      render json: result_data
    else
      render json: { error: 'Unable To Add Results Data' }, status: 400
    end
  end

  # GET /api/v1/daily_result_stats
  def daily_result_stats
    daily_result_stats = DailyResultStat.all

    render json: daily_result_stats
  end

  private

  def result_data_params
    params.require(:results_datum).permit(:subject, :marks, :timestamp)
  end
end
