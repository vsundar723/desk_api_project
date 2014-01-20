require 'spec_helper'

describe Client do
	describe '#case_list_by_filter' do
		before(:each) do
			
    end
		context 'when the service returns json' do
			let(:filter_id) {'filter_id'}
			let(:consumer) { OAuth::Consumer.new(
	      'IaGbipM2eAUMts2Eeg',
	      'y5zo6h69DFzk5k8PHQ2KrLMgaX0jPNoKOSHw1MMx',
	      :site => 'https://vsundar723.desk.com',
	      :scheme => :header
	    )}

	    let(:access_token) {OAuth::AccessToken.from_hash(
	      consumer,
	      :oauth_token => 'CH0BX0rOHPYg6h1dOZyQ',
	      :oauth_token_secret => 'eCJvVr0UC61rpPWrAmVbkrQdAWNFbbGVE4IsdDEd'
	    )}
			
			# it 'returns json' do
				
			# 	expect(Client.new.case_list_by_filter(access_token, '1850829'))
			# 		.to eq(nil)
			# end
		end
	end
end