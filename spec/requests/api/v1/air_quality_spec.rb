require "rails_helper"

RSpec.describe Api::V1::AirQualityController, type: :request do
  it "returns the correct response and data" do
    q = "India" #need to convert
    lat = 28.6448
    lon = 77.2167
    appid = Rails.application.credentials.open_weather[:appid]
    
    json_response = File.read("spec/fixtures/open_weather_india.json")
    stub_request(:get, "http://api.openweathermap.org/data/2.5/air_pollution?lat=#{lat}&lon=#{lon}&appid=#{appid}").
      to_return(status: 200, body: json_response, headers: {})
    
    get "/api/v1/air_quality?country=India"

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    expect(response).to have_http_status(200)
    # expect(parsed_json).to be_a(Hash)
  end
end