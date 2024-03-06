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
    expect(parsed_response[:data]).to be_a(Hash)
    expect(parsed_response[:data][:id]).to eq(nil)
    expect(parsed_response[:data][:type]).to eq("learning_resource")
    expect(parsed_response[:data][:attributes]).to be_a(Hash)
    expect(parsed_response[:data][:attributes][:country]).to eq("ethiopia")
    expect(parsed_response[:data][:attributes][:video]).to be_a(Hash)
    expect(parsed_response[:data][:attributes][:video][:title]).to be_a(String)
    expect(parsed_response[:data][:attributes][:video][:youtube_video_id]).to be_a(String)
    expect(parsed_response[:data][:attributes][:images]).to be_an(Array)
    expect(parsed_response[:data][:attributes][:images].count).to eq(10)
    expect(parsed_response[:data][:attributes][:images][0][:alt_tag]).to be_a(String)
    expect(parsed_response[:data][:attributes][:images][0][:url]).to be_a(String)
  end
end