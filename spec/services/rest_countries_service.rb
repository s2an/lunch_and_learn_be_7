require "rails_helper"

RSpec.describe RestCountriesService do
  it "fetches all of the country" do

    json_response = File.read("spec/fixtures/rest_countries_all.json")
    stub_request(:get, "https://restcountries.com/v3.1/all").
      to_return(status: 200, body: json_response, headers: {})

    results = RestCountriesServiceService.new.country

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
end