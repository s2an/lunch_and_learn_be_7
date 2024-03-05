require "rails_helper"

RSpec.describe "Api::V1::TouristSites", type: :request do
  it "gets the country's capital city's latlon"  do
    q = "France"

    rest_countries_response = File.read("spec/fixtures/rest_countries_all.json")
    # stub_request(:get, "https://api.geoapify.com/v2/places?#{q}").
      to_return(status: 200, body: rest_countries_response, headers: {})
    
    get "/api/v1/tourist_sites?country=#{q}"

    expect(response).to have_http_status(200)
    
    parsed_rest_countries = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_rest_countries).to be_a(Hash)
    expect(parsed_rest_countries[:data]).to be_an(Array)
  end

  # it "gets the tourist spots"  do
  #   q = "France"

  #   places_response = File.read("spec/fixtures/places_#{q.downcase}.json")
  #   # stub_request(:get, "https://api.geoapify.com/v2/places?#{q}").
  #     to_return(status: 200, body: places_response, headers: {Authorization: Rails.application.credentials.pexels[:authorization]})
    
  #   get "/api/v1/tourist_sites?country=#{q}"

  #   expect(response).to have_http_status(200)
    
  #   parsed_places = JSON.parse(response.body, symbolize_names: true)

  #   expect(parsed_places).to be_a(Hash)
  #   expect(parsed_places[:data]).to be_an(Array)
  # end
end