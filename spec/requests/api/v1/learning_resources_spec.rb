require 'rails_helper'

RSpec.describe 'Api::V1::LearningResources', type: :request do
  it "returns the correct response and data from pexels"  do
    q = "Ethiopia"

    pexels_response = File.read("spec/fixtures/pexels_ethiopia.json")
    stub_request(:get, "https://api.pexels.com/v1/search?query=#{q}").
      to_return(status: 200, body: pexels_response, headers: {Authorization: Rails.application.credentials.pexels[:authorization]})
    
    get "/api/v1/learning_resources?country=#{q}"

    expect(response).to have_http_status(200)
    
    parsed_pexels = JSON.parse(pexels_response.body, symbolize_names: true)

    expect(parsed_pexels).to be_a(Hash)
    expect(parsed_pexels[:data]).to be_an(Array)
  end
end