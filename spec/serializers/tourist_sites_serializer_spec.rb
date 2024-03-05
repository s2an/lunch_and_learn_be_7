require "rails_helper"

RSpec.describe TouristSitesSerializer do

  it "serializes" do
    tourist_site = TouristSite.new( id: "null", type: "tourist_site", address: "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France", place_id: "51d28...")
    expect(tourist_site).to eq(
    {
        "data": [
            {
                "id": "null",
                "type": "tourist_site",
                "attributes": {
                    "name": "Tour de l'horloge",
                    "address": "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
                    "place_id": "51d28..."
                }
            }
          ]
        }
    )
  end
end