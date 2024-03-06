require "rails_helper"

RSpec.describe PexelsService do
  it "PEXELS: connects to API" do
    q = "Ethiopia"

    pexels_response = File.read("spec/fixtures/pexels_#{q.downcase}.json")
    stub_request(:get, "https://api.pexels.com/v1/search?query=#{q}&per_page=10").
      to_return(status: 200, body: pexels_response, headers: {Authorization: Rails.application.credentials.pexels[:authorization]})

    results = PexelsService.get_images_from_pexels(q)
    require "pry"; binding.pry
    expect(results).to be_a(Hash)
    # expect(results).to have_key(:)
    # expect(results).to have_key(:)
  end
end