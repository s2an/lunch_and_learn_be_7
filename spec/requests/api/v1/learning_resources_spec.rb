require 'rails_helper'

RSpec.describe 'Api::V1::LearningResources', type: :request do
  it "returns the correct response and data"  do
    q = "Ethiopia"

    pexels_response = File.read("spec/fixtures/pexels_#{q.downcase}.json")
    stub_request(:get, "https://api.pexels.com/v1/search?query=#{q}&per_page=10").
      to_return(status: 200, body: pexels_response, headers: {Authorization: Rails.application.credentials.pexels[:authorization]})

    youtube_response = File.read("spec/fixtures/youtube_#{q.downcase}.json")
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{q}&key=#{Rails.application.credentials.youtube[:key]}").
      to_return(status: 200, body: youtube_response, headers: {})
    
    get "/api/v1/learning_resources?country=#{q}"
      
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry

    expect(response).to have_http_status(200)
    expect(parsed_response).to be_a(Hash)
    expect(parsed_response[:data]).to be_an(Array)
  end
end