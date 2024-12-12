# spec/support/vcr_setup.rb

require 'vcr'

VCR.configure do |config|
  # The directory where your cassette files will be stored
  config.cassette_library_dir = 'spec/cassettes'

  # This tells VCR to hook into your HTTP library (e.g., Net::HTTP, HTTParty, etc.)
  config.hook_into :webmock

  # To allow real HTTP requests if needed (useful for testing edge cases)
  config.allow_http_connections_when_no_cassette = false

  # Use a real request when no cassette is available (only for specific tests)
  config.ignore_localhost = true
end
