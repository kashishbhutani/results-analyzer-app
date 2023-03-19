# Require Dependencies
require 'rest-client'
require 'pry'
require 'json-schema'
require 'rspec'

# Define JSON API Response Matchers
RSpec::Matchers.define :match_response_schema do |schema|
  match do |response|
    schema_directory = "#{Dir.pwd}/features/support/api/schemas"
    schema_path = "#{schema_directory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, response.body, strict: true)
  rescue JSON::Schema::ValidationError
    puts $ERROR_INFO.message
  end
end
