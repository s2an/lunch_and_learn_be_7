require "rails_helper"

RSpec.describe OpenWeatherService do
  it "gets the air quality" do
    q = "India"

    json_response = File.read("spec/fixtures/rest_countries_india.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/#{q}?fullText=true").
      to_return(status: 200, body: json_response, headers: {})

    lat = RestCountriesService.get_country_capital_latlon(q).first
    lon = RestCountriesService.get_country_capital_latlon(q).last
    appid = Rails.application.credentials.open_weather[:appid]
    # require "pry"; binding.pry
    
    json_response = File.read("spec/fixtures/open_weather_india.json")
    stub_request(:get, "http://api.openweathermap.org/data/2.5/air_pollution?lat=#{lat}&lon=#{lon}&appid=#{appid}").
      to_return(status: 200, body: json_response, headers: {})
    
    results = OpenWeatherService.new.get_air_quality_from_api(lat, lon)
# require "pry"; binding.pry
    expect(results).to be_a(Hash)
    expect(results).to have_key(:coord)
    expect(results).to have_key(:list)
  end
end