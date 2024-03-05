require "rails_helper"

RSpec.describe TouristSite do
  it "exists" do 
    country = "France"

    features = {
      id: nil,
      type: "tourist_site",
      name: "Mistinguett",
      address: "Mistinguett, Boulevard des Capucines, 75009 Paris, France",
      place_id: "5150296508b6a00240592609866f616f4840f00103f901876363840200000092030b4d697374696e6775657474"
  }

    tourist_site = TouristSite.new(features)

    expect(tourist_site).to be_a(TouristSite)
    expect(tourist_site.id).to eq(nil)
  end
end