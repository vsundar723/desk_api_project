require 'spec_helper'

describe CasesController do
	before(:each) do
		stub_request(:get, "https://vsundar723.desk.com/api/v2/filters/1850829/cases").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'OAuth oauth_consumer_key="IaGbipM2eAUMts2Eeg", oauth_nonce="RUyS44i9p8VLhSm2l2rPr0eR1TbG3TqyLiyMNUjPc", oauth_signature="0mBt%2Fm0kqK5BIdTph47%2Bd7NcW3w%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1390196377", oauth_token="CH0BX0rOHPYg6h1dOZyQ", oauth_version="1.0"', 'User-Agent'=>'OAuth gem v0.4.7'}).
         to_return(:status => 200, :body => "abc", :headers => {})
	end
	context 'get index' do
  	it "should get index" do
    	get :index
    	assert_response :success
  	end
	end
end
