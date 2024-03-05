require "rails_helper"

RSpec.describe "Api::V1::TouristSites", type: :request do
  it "gets the countries capital's latlon" do
    country = "France"

    json_response = File.read("spec/fixtures/rest_countries_#{country.downcase}.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}?fullText=true").
      to_return(status: 200, body: json_response, headers: {})

    results = Api::V1::TouristSitesController.get_country_capital_latlon(country)

  # require "pry"; binding.pry
    expect(results).to be_an(Array)
    expect(results.first).to eq(48.87)
    expect(results.last).to eq(2.33)
  end

  it "gets the tourist spots"  do
    country = "France"

    json_response = File.read("spec/fixtures/rest_countries_france.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}?fullText=true").
      to_return(status: 200, body: json_response, headers: {})

    results = Api::V1::TouristSitesController.get_country_capital_latlon(country)

    lat = results[0]
    lon = results[1]
    places_response = File.read("spec/fixtures/places_#{country.downcase}.json")
    stub_request(:get, "https://api.geoapify.com/v2/places?categories=tourism.sights&bias=proximity:#{lon},#{lat}&limit=10&apiKey=#{Rails.application.credentials.places[:apiKey]}").
    to_return(status: 200, body: places_response, headers: {})
    
    get "/api/v1/tourist_sites?country=#{country}"

    # require "pry"; binding.pry
    expect(response).to have_http_status(200)
    parsed_places = JSON.parse(response.body, symbolize_names: true)
# require "pry"; binding.pry
    expect(parsed_places).to be_a(Hash)
    expect(parsed_places[:data]).to be_an(Array)
  end
end