require "rails_helper"

RSpec.describe RestCountriesService do
  xit "connects to all of the countries" do

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

    json_response = File.read("spec/fixtures/rest_countries_india.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/#{q}?fullText=true").
      to_return(status: 200, body: json_response, headers: {})

    results = RestCountriesService.get_country_capital_latlon(q)

  require "pry"; binding.pry
    expect(results).to be_an(Array)
    expect(results.first).to eq(28.6)
    expect(results.last).to eq(77.2)
  end
end