Given '1 student submitted the online test' do
  @student_test_data = {
    results_datum: {
      subject: 'Science',
      timestamp: '2023-03-19 12:01:43.678',
      marks: 81.25
    }
  }
end

When 'MSM service submits the test result data to result analyzer app' do
  @response = add_results_data(@student_test_data)
rescue StandardError => e
  puts e.message
end

When 'MSM service submits the incomplete test result data to result analyzer app' do
  @student_test_data[:results_datum].merge!(subject: '')
  @response = add_results_data(@student_test_data)
rescue StandardError => e
  puts e.message
end

Then 'the test result should get stored' do
  expect(@response.code).to be_eql 201
  expect(@response).to match_response_schema('results_data_success')
end

Then 'the test result should not get stored' do
  expect(@response.code).to be_eql 400
  expect(@response).to match_response_schema('results_data_fail')
end

private

def add_results_data(payload)
  RestClient.post(add_results_data_url, payload, {})
rescue RestClient::ExceptionWithResponse => e
  e.response
end

def add_results_data_url
  'http://localhost:3000/api/v1/results_data'
end
