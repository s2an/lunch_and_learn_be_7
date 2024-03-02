require "rails_helper"

RSpec.describe EdamamService do
  it "fetches a recipe for a country" do
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?type=public&q=Ethiopia"). #how will this work with the api requirements in the query?
      to_return(status: 200, body: json_response, headers: {})
    
    search_term = "Ethiopia" 
    results = EdamamService.search(search_term)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:from)
    expect(results).to have_key(:to)
    expect(results).to have_key(:count)
    expect(results).to have_key(:_links)
    expect(results).to have_key(:hits)

    recipes = results[:hits]

    expect(recipes).to be_an(Array)
    expect(recipes).to have_key(:uri)
    expect(recipes).to have_key(:label)
    expect(recipes).to have_key(:image)
    expect(recipes).to have_key(:images)
    expect(recipes).to have_key(:source)
    expect(recipes).to have_key(:url)
    expect(recipes).to have_key(:shareAs)
    expect(recipes).to have_key(:yield)
    expect(recipes).to have_key(:dietLabels)
    expect(recipes).to have_key(:healthLabels)
    expect(recipes).to have_key(:cautions)
    expect(recipes).to have_key(:ingredientLines)
    expect(recipes).to have_key(:ingredients)

    ingredients = recipes[:ingredients]

    expect(ingredients).to be_an(Array)
    expect(ingredients).to have_key(:text)
    expect(ingredients).to have_key(:quantity)
    expect(ingredients).to have_key(:measure)
    expect(ingredients).to have_key(:food)
    expect(ingredients).to have_key(:weight)
    expect(ingredients).to have_key(:foodCategory)
    expect(ingredients).to have_key(:foodId)
    expect(ingredients).to have_key(:image)
  end
end