class CasesController < ApplicationController
  before_action :authorize

  def index
    if @access_token.present?
      @cases = client.case_list_by_filter(@access_token, 1850829)
      @labels = client.labels_list(@access_token)
      # @filters = Client.filters_list(@access_token)
    else
      render '/403.html.haml'
    end

    # binding.pry
    # render :json => @filters
  end

  def show
    if @access_token.present?
      @cases = client.case_list_by_filter(@access_token, 1850829)
      @labels = client.labels_list(@access_token)
    else
      render '/403.html.haml'
    end
  end

  def create_label
    json = create_json
    response = client.create_label(@access_token, json)
  end

  def create_label_and_apply
    label_json = create_label
    case_id = params[:selected_case]
    response = client.apply_label_to_case(@access_token, case_id, JSON.parse(label_json.body))
  end

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
