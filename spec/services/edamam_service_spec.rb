require "rails_helper"

RSpec.describe EdamamService do

  it "SAD PATH: returns an empty array if no parameter/empty value" do
    q = "" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
      to_return(status: 200, body: json_response, headers: {})
    
    results = EdamamService.new.api_recipe(q)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:data)
    expect(results[:data]).to be_an(Array)
    expect(results[:data]).to eq([])
    
  end
  
  xit "should have these fields" do # <-- move to poro/facade
    q = "Ethiopia" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
      to_return(status: 200, body: json_response, headers: {})
    
    results = EdamamService.new.api_recipe(q)

    expect(results).to be_a(Hash)
    expect(results[:data]).to be_an(Array)

    expect(results[:data][0]).to be_a(Hash)
    expect(results[:data][0]).to have_key(:id)
    expect(results[:data][0]).to have_key(:type)
    expect(results[:data][0]).to have_key(:attributes)

    expect(results[:data][0][:attributes]).to be_a(Hash)
    expect(results[:data][0][:attributes]).to have_key(:title)
    expect(results[:data][0][:attributes]).to have_key(:url)
    expect(results[:data][0][:attributes]).to have_key(:country)
    expect(results[:data][0][:attributes]).to have_key(:image)
  end

  xit "determines which fields should NOT be present" do # <-- move to poro/facade
    q = "Ethiopia" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
      to_return(status: 200, body: json_response, headers: {})
    
    results = EdamamService.new.api_recipe(q)

    expect(results).to be_a(Hash)
    expect(results).to_not have_key(:from)
    expect(results).to_not have_key(:to)
    expect(results).to_not have_key(:count)
    expect(results).to_not have_key(:_links)
    expect(results).to_not have_key(:hits)
    expect(results).to_not have_key(:uri)
    expect(results).to_not have_key(:label)
    expect(results).to_not have_key(:images)
    expect(results).to_not have_key(:source)
    expect(results).to_not have_key(:shareAs)
    expect(results).to_not have_key(:yield)
    expect(results).to_not have_key(:dietLabels)
    expect(results).to_not have_key(:healthLabels)
    expect(results).to_not have_key(:cautions)
    expect(results).to_not have_key(:ingredientLines)
    expect(results).to_not have_key(:ingredients)
    expect(results).to_not have_key(:text)
    expect(results).to_not have_key(:quantity)
    expect(results).to_not have_key(:measure)
    expect(results).to_not have_key(:food)
    expect(results).to_not have_key(:weight)
    expect(results).to_not have_key(:foodCategory)
    expect(results).to_not have_key(:foodId)
  end
  
  it "fetches a recipe for a country" do
    
    q = "Ethiopia" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    # need to ask about API displaying during test results if not correctly formatted
    # (because webmock suggests a stub with the api key)
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
    to_return(status: 200, body: json_response, headers: {})
    
    # needed to .new because it is no longer a class method
    # Ian used a class method because it doesn't need to be saved, but that doesn't help with the refactoring?
    results = EdamamService.new.api_recipe(q)
    
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