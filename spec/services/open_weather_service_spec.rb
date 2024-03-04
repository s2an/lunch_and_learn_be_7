require "rails_helper"

RSpec.describe OpenWeatherService do
  it "gets the air quality" do
    q = "India"
    lat = 28.6448
    lon = 77.2167
    appid = Rails.application.credentials.open_weather[:appid]
    
    json_response = File.read("spec/fixtures/open_weather_india.json")
    stub_request(:get, "http://api.openweathermap.org/data/2.5/air_pollution?lat=#{lat}&lon=#{lon}&appid=#{appid}").
      to_return(status: 200, body: json_response, headers: {})
    
    results = OpenWeatherService.new.get_air_quality_from_api(q)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:coord)
    expect(results).to have_key(:list)
  end
end