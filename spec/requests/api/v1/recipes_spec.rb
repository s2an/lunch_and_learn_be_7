require "rails_helper"

RSpec.describe Api::V1::RecipesController, type: :request do
  it "returns the correct response and data" do
    q = "Ethiopia" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
      to_return(status: 200, body: json_response, headers: {})

    get_recipes = RecipeFacade.get_recipes_by_country(q)
  #  require "pry"; binding.pry
    get "/api/v1/recipes"

    expect(response).to have_http_status(200)
    expect(get_recipes).to be_an(Array)
  end
end