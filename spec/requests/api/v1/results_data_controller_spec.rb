require 'rails_helper'

RSpec.describe 'ResultsData', type: :request do
  include ApiHelpers

  describe 'POST /api/v1/results_data' do
    scenario 'Valid Result Data Attributes' do
      # Send a POST request to /results_data, with these parameters
      # The controller will treat them as JSON
      post '/api/v1/results_data', params: {
        results_datum: {
          subject: 'Science',
          marks: 85.83,
          timestamp: '2022-04-18 17:47:27.678'
        }
      }

      # response should have HTTP Status 201 Created
      expect(response.status).to eq(201)

      # check the value of the returned response hash
      expect(json[:subject]).to eq('Science')
      expect(json[:marks]).to eq(85.83)
      expect(json[:timestamp]).to eq('2022-04-18T17:47:27.678Z')

      # 1 new results data record is created
      expect(ResultsData.count).to eq(1)
    end

    scenario 'Invalid Result Data Attributes' do
      post '/api/v1/results_data', params: {
        results_datum: {
          subject: '',
          marks: 85.83,
          timestamp: '2022-04-18 17:47:27.678'
        }
      }

      # response should have HTTP Status 400 Bad Request
      expect(response.status).to eq(400)

      # check the value of the returned error hash
      expect(json[:error]).to eq('Unable To Add Results Data')

      # no new results data record is created
      expect(ResultsData.count).to eq(0)
    end
  end
end
