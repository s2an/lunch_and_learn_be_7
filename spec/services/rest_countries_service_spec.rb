require "rails_helper"

RSpec.describe RestCountriesService, type: :service do
  it "connects to all of the countries" do

    json_response = File.read("spec/fixtures/rest_countries_all.json")
    stub_request(:get, "https://restcountries.com/v3.1/all").
      to_return(status: 200, body: json_response, headers: {})

    results = RestCountriesService.get_countries

    expect(results).to be_an(Array)
    expect(results.first).to have_key(:name)
    expect(results.first).to have_key(:currencies)
    
    first_country = results[0]
    expect(first_country).to be_a(Hash)
    expect(first_country[:name][:common]).to eq("Cyprus")
    
    last_country = results[-1]

    expect(last_country).to be_a(Hash)
    expect(last_country[:name][:common]).to eq("Hong Kong")
  end

  it "returns a country at random" do # <--not SRP
    json_response = File.read("spec/fixtures/rest_countries_all.json")
    stub_request(:get, "https://restcountries.com/v3.1/all").
      to_return(status: 200, body: json_response, headers: {})

    results_1 = RestCountriesService.get_random_country
    results_2 = RestCountriesService.get_random_country
    results_3 = RestCountriesService.get_random_country
    results_4 = RestCountriesService.get_random_country
    results_5 = RestCountriesService.get_random_country

    # not the best test, but unlikely to fail often
    expect(results_1).to_not eq(results_2)
    expect(results_2).to_not eq(results_3)
    expect(results_4).to_not eq(results_5)
  end
end