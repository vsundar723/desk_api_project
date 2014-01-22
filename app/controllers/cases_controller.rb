class CasesController < ApplicationController
  before_action :authorize

  def index
    if @access_token.present?
      @cases = client.case_list_by_filter(@access_token, 1850829)
      @labels = client.labels_list(@access_token)
    else
      render '/403.html.haml'
    end
  end

  def show
    if @access_token.present?
      @cases = client.case_list_by_filter(@access_token, 1850829)
      @labels = client.labels_list(@access_token)
    else
      render '/403.html.haml'
    end
  end

  # Create label action called when create button in the form is clicked
  def create_label
    response = client.create_label(@access_token, create_json)
    render :json => response, :status => :ok
  end

  # Create label and apply action called when create and apply button in the form is clicked.
  # This takes the id of the case to apply the label from the params.
  def create_label_and_apply
    label_json = client.create_label(@access_token, create_json)
    if label_json.code == '201'
      response = client.apply_label_to_case(@access_token, params[:selected_case], JSON.parse(label_json.body))
    end
    render :json => response, :status => :ok
  end

  # Creates JSON from the params.
  def create_json
    {
      name: params[:name],
      description: params[:description],
      types: params[:types],
      enabled: params[:enabled],
      color: params[:color]
    }
  end
end
