require "rails_helper"

RSpec.describe TouristSitesSerializer do

  it "serializes" do
    # need a poro
    expect(TouristSite).to eq(
    {
        "data": [
            {
                "id": null,
                "type": "tourist_site",
                "attributes": {
                    "name": "Tour de l'horloge",
                    "address": "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
                    "place_id": "51d28..."
                }
            }
    )
  end
end