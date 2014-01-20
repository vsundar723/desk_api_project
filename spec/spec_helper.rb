ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'webmock/rspec'

RSpec.configure do |config|
	config.include WebMock::API
  # Force tests to render views to catch errors with template rendering
  config.render_views = true
  config.before(:each) do
    stub_request(:get, "http://vsundar723.desk.com/api/v2/filters/1850829/cases")
			.with(
				:headers => {
					'Accept'=>'*/*',
					'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
					'Authorization'=>'OAuth oauth_consumer_key="IaGbipM2eAUMts2Eeg",
					oauth_nonce="RUyS44i9p8VLhSm2l2rPr0eR1TbG3TqyLiyMNUjPc",
					oauth_signature="0mBt%2Fm0kqK5BIdTph47%2Bd7NcW3w%3D",
					oauth_signature_method="HMAC-SHA1",
					oauth_timestamp="1390196377",
					oauth_token="CH0BX0rOHPYg6h1dOZyQ",
					oauth_version="1.0"',
					'User-Agent'=>'OAuth gem v0.4.7'
				}
			)
  end
end
