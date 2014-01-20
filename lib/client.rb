class Client

  # Takes in access_token and filter id to return the case list by filter
  def case_list_by_filter(access_token, filter_id)
    cases_response = access_token.request(:get, "https://vsundar723.desk.com/api/v2/filters/#{filter_id}/cases")
    cases = JSON.parse(cases_response.body, :symbolize_names => true)[:_embedded][:entries]
    case_array = Array.new
    cases.each do |case_object|
    	case_array.push(Case.new(case_object))
    end
    case_array
  end

  # Takes in access_token to return the list of labels
  def labels_list(access_token)
    labels_response = access_token.request(:get, "https://vsundar723.desk.com/api/v2/labels")
    labels = JSON.parse(labels_response.body, :symbolize_names => true)[:_embedded][:entries]
    label_array = Array.new
    labels.each do |label|
    	label_array.push(Label.new(label))
    end
    label_array
  end

  # Takes in access_token and json data from the form to create the label
  def create_label(access_token, json_data)
  	label_response = access_token.request(
      :post,
      "https://vsundar723.desk.com/api/v2/labels",
      json_data.to_json
    )
  end

  # Takes in access_token, case id and the label to update the case
  def apply_label_to_case(access_token, case_id, label_json)
    json_data = {
      label_action: "append",
      labels: label_json["name"]
    }
    label_response = access_token.request(
      :put, 
      "https://vsundar723.desk.com/api/v2/cases/#{case_id}",
      JSON.generate(json_data)
    )
  end
end