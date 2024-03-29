require "rails_helper"

RSpec.describe RecipeFacade do
  it "should call the facade and retrieve search results" do
    q = "Ethiopia" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
      to_return(status: 200, body: json_response, headers: {})

    results = RecipeFacade.get_recipes_by_country(q)

    expect(results).to be_an(Array)

    recipe = results.first

    expect(recipe).to be_a(Recipe)
    expect(recipe.id).to eq(nil)
    expect(recipe.type).to eq("recipe")
    expect(recipe.title).to eq("Ethiopia Coffee Pancakes With Blueberry Maple Syrup recipes")
    expect(recipe.url).to eq("http://dadwithapan.com/recipe/ethiopia-coffee-pancakes-with-blueberry-maple-syrup/")
    expect(recipe.country).to eq("ethiopia")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/92d/92de05b764a18716ac07104001b89788?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLWVhc3QtMSJHMEUCICKt4qYYg8eCY8sheMfiwv%2FzD0g%2Bk5adv8L8XqEp3azoAiEA%2FUKPVT4neqi7MuxMH6linP5rrdMS4VFkQjtle2vFTPkquQUITRAAGgwxODcwMTcxNTA5ODYiDELxQliUwLa3Is0zdSqWBbF3goStTIOjAXMHGIS4adFbkq27tBhrD8aacW08Rp6XP43XKhoOar5bLd2sWaq5eJ3ZM49BFJH3HoRD23MSSYWBs3GezAncIKI5fbsGI2YZaiXz%2FnYQqb2aunwuux4kk36j9FaG2ZAnzQXohjxZB86kat2KVMfDRCdrHCdf5%2BhadDoyBXvIQsqYl%2FTrwFRFjGDHb7Myyi%2FuKqVGLU1sIHvBXT1r2lHigCrggdtCCTOrg6FKr%2FHzbig45I4vCuy6B%2BJ2llVjiB9%2BrkSPVCItOdNadwwsO9LvnwUCnOm7WlWBVYfqkAd%2FgyGcu4biAConSevKIkB0Voma9tPslyU9UktoCpaTqB6IjiNaOyAsIddaHLscn0m2VJ%2FzXqttqUBwsks2jmR8ulOyv%2BVBY63NTuQmvtKrpT3qbEwnQm4P5AiuG6Wprdc%2BJqvHiRriUrmPF%2B8zcR0QPvAqEpRYvKvUJQDt6lFXTFYvAUGa6SPTj62EttjshKLlzNfzy6RYEAcRWBvQvwrxxu7AzcOkScqNL%2BThXN2e01hNYVq5ZjpkyVXcPiYlaGbjBSHjO%2FPIRJYH4SliukLzDsq6xE8mP9N3ldNCkc05U4fYHUo0yoe13hg4OUKwIg97Ue2E6dYKJ%2FTe9YNQZMxzymU4wUhjgtbNlzJn7O4E3sivJToP%2FcPtSM4XzAsZj5Sv3WzDOLcGJMUpVKeMinSiMpN%2B0ZRpIErphlpFAYrgTKMblJ7YwKdpKWNODM0w4J0cJ6ndjBgsZSZsTxVNLaFaae4JMIbusrwgfT23zA4jFc4QE1v5t7oOkBmKQGz2DNGgmI2ozp1qHqRHUlR6%2FJH0e6xQSu6RDj78y8kI6tnyVLRyr7HAgWNU9stIBLGhVpSSMJX%2Fja8GOrEBYJpD2J9mPwqA6Z8uHm2JJdPtsYZlXSkP8SP1vvcyEz9cqJIBcUxoRhGcloFhbw3WCGnFyEw9n88wgSufX%2F7Wk8Qrr5ofl%2FuV9cSn88As3IDNWE5dBEdYCIukavPNEH1ylt6qG%2FqCZ8cVfYOEUufQwY2RgtKnNmzEOWFH2raN9%2BRFlgGr0WxenHNWXZxzJRp1qjTo83RL%2FCtqMpeYew1etxQ9KAasuQjklbNjlqP7VbRJ&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240302T195028Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFJVX3HCUT%2F20240302%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1ce55ba3a186d33e1719d6b4203512348d7116637b6436e71df9385ce163ffbb")
  end

  it "should not have these fields" do
    q = "Ethiopia" 
    id = Rails.application.credentials.edamam[:app_id]
    key = Rails.application.credentials.edamam[:app_key]
    
    json_response = File.read("spec/fixtures/edamam_ethiopia.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{id}&app_key=#{key}&q=#{q}&type=public").
      to_return(status: 200, body: json_response, headers: {})

    results = RecipeFacade.get_recipes_by_country(q)

    recipe = results.first

    expect(recipe).to_not respond_to(:from)
    expect(recipe).to_not respond_to(:to)
    expect(recipe).to_not respond_to(:count)
    expect(recipe).to_not respond_to(:_links)
    expect(recipe).to_not respond_to(:hits)
    expect(recipe).to_not respond_to(:uri)
    expect(recipe).to_not respond_to(:label)
    expect(recipe).to_not respond_to(:images)
    expect(recipe).to_not respond_to(:source)
    expect(recipe).to_not respond_to(:shareAs)
    expect(recipe).to_not respond_to(:yield)
    expect(recipe).to_not respond_to(:dietLabels)
    expect(recipe).to_not respond_to(:healthLabels)
    expect(recipe).to_not respond_to(:cautions)
    expect(recipe).to_not respond_to(:ingredientLines)
    expect(recipe).to_not respond_to(:ingredients)
    expect(recipe).to_not respond_to(:text)
    expect(recipe).to_not respond_to(:quantity)
    expect(recipe).to_not respond_to(:measure)
    expect(recipe).to_not respond_to(:food)
    expect(recipe).to_not respond_to(:weight)
    expect(recipe).to_not respond_to(:foodCategory)
    expect(recipe).to_not respond_to(:foodId)
  end
end