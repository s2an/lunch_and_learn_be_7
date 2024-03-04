require "rails_helper"

RSpec.describe RestCountriesService do
  it "connects to all of the countries" do

    json_response = File.read("spec/fixtures/rest_countries_all.json")
    stub_request(:get, "https://restcountries.com/v3.1/all").
      to_return(status: 200, body: json_response, headers: {})

    results = RestCountriesService.get_countries
    
    expect(results).to be_an(Array)
    expect(results).to have_key(:name)
    expect(results).to have_key(:currencies)
    
    first_country = results[0]
    expect(first_country).to be_a(Hash)
    expect(first_country[:name]).to have_key([:common])
    expect(first_country[:name][:common]).to eq("Cyprus")
    
    last_country = results[-1]

    expect(last_country).to be_a(Hash)
    expect(last_country[:name]).to have_key([:common])
    expect(last_country[:name][:common]).to eq("Hong Kong") # <-- I wonder how many meetings/discussions that took...
  end

  it "returns a countries capital's lat and lon" do

    q = "India"

    WebMock.allow_net_connect!

    results = RestCountriesService.get_country_cap_lat_lon(q)
  # "name": {
  #   "common": "India",
  #   "capital": [
  # "New Delhi"
  # ],
  # "capitalInfo": {
  #   "latlng": [
  #   28.6,
  #   77.2
  #   ]
  #   },
  require "pry"; binding.pry
    expect(results).to be_an(Array)
    expect(results).to have_key(:capital)
    expect(results).to have_key(:capitalInfo)
    expect(results[:capitalInfo]).to have_key(:latlng)
  end
end