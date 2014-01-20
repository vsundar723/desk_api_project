class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    consumer = OAuth::Consumer.new(
      'IaGbipM2eAUMts2Eeg',
      'y5zo6h69DFzk5k8PHQ2KrLMgaX0jPNoKOSHw1MMx',
      :site => 'https://vsundar723.desk.com',
      :scheme => :header
    )

    @access_token = OAuth::AccessToken.from_hash(
      consumer,
      :oauth_token => 'CH0BX0rOHPYg6h1dOZyQ',
      :oauth_token_secret => 'eCJvVr0UC61rpPWrAmVbkrQdAWNFbbGVE4IsdDEd'
    )
  end

  def client
  	client = Client.new
  end
end
