require "rails_helper"

RSpec.describe Api::V1::RecipesController, type: :request do
  it "returns the correct response and data" do
    q = "Ethiopia" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
      to_return(status: 200, body: json_response, headers: {})

    get "/api/v1/recipes?q=#{q}"

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to have_http_status(200)
    expect(parsed_json).to be_a(Hash)
    expect(parsed_json[:data]).to be_an(Array)
  end

  xit "returns blank data" do
    q = "" 

    # It works! uncomment to try
    # WebMock.allow_net_connect!

    get "/api/v1/recipes?q=#{q}"

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    expect(response).to have_http_status(200)
    expect(parsed_json).to be_a(Hash)
    expect(parsed_json[:data]).to be_an(Array)
  end
end