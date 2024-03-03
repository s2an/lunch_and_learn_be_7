require "rails_helper"

# need to ask about API displaying during test results if not correctly formatted
# (because webmock suggests a stub with the api key)

RSpec.describe EdamamService do
  it "fetches a recipe for a country" do

    q = "Ethiopia" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
      to_return(status: 200, body: json_response, headers: {})
    
    # needed to .new because it is no longer a class method
    results = EdamamService.new.recipe(q)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:from)
    expect(results).to have_key(:to)
    expect(results).to have_key(:count)
    expect(results).to have_key(:_links)
    expect(results).to have_key(:hits)

    recipes = results[:hits]
    expect(recipes).to be_an(Array)
    expect(recipes.first).to have_key(:recipe)

    recipe = recipes.first[:recipe]

    expect(recipe).to have_key(:uri)
    expect(recipe).to have_key(:label)
    expect(recipe).to have_key(:image)
    expect(recipe).to have_key(:images)
    expect(recipe).to have_key(:source)
    expect(recipe).to have_key(:url)
    expect(recipe).to have_key(:shareAs)
    expect(recipe).to have_key(:yield)
    expect(recipe).to have_key(:dietLabels)
    expect(recipe).to have_key(:healthLabels)
    expect(recipe).to have_key(:cautions)
    expect(recipe).to have_key(:ingredientLines)
    expect(recipe).to have_key(:ingredients)

    ingredients = recipe[:ingredients]
    expect(ingredients).to be_an(Array)

    ingredient = ingredients.first

    expect(ingredient).to have_key(:text)
    expect(ingredient).to have_key(:quantity)
    expect(ingredient).to have_key(:measure)
    expect(ingredient).to have_key(:food)
    expect(ingredient).to have_key(:weight)
    expect(ingredient).to have_key(:foodCategory)
    expect(ingredient).to have_key(:foodId)
    expect(ingredient).to have_key(:image)
  end
end