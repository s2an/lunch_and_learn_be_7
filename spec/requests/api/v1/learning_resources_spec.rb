require 'rails_helper'

RSpec.describe 'Api::V1::LearningResources', type: :request do
  it "PEXELS: returns the correct response and data"  do
    q = "Ethiopia"

    pexels_response = File.read("spec/fixtures/pexels_#{q.downcase}.json")
    stub_request(:get, "https://api.pexels.com/v1/search?query=#{q}").
      to_return(status: 200, body: pexels_response, headers: {Authorization: Rails.application.credentials.pexels[:authorization]})
    
    get "/api/v1/learning_resources?country=#{q}"

    expect(response).to have_http_status(200)
    
    parsed_pexels = JSON.parse(pexels_response.body, symbolize_names: true)

    expect(parsed_pexels).to be_a(Hash)
    expect(parsed_pexels[:data]).to be_an(Array)
  end

  it "YOUTUBE: returns the correct response and data"  do
    q = "Ethiopia"

    youtube_response = File.read("spec/fixtures/youtube_#{q.downcase}.json")
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{q}&key=#{Rails.application.credentials.youtube[:key]}").
      to_return(status: 200, body: youtube_response, headers: {})
    
    get "/api/v1/learning_resources?country=#{q}"

    expect(response).to have_http_status(200)
    
    parsed_youtube = JSON.parse(youtube_response.body, symbolize_names: true)

    expect(parsed_youtube).to be_a(Hash)
    expect(parsed_youtube[:data]).to be_an(Array)
  end
end