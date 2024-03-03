class EdamamService

  def self.get_recipe(q)
    conn = Faraday.new(url: "https://api.edamam.com/api/recipes/v2") do |faraday|
      faraday.params[:type] = "public"
      faraday.params[:q] = q
      faraday.params[:app_id] = Rails.application.credentials.edamam[:app_id]
      faraday.params[:app_key] = Rails.application.credentials.edamam[:app_key]
    end

    response = conn.get

    JSON.parse(response.body, symbolize_names: true)
  end

  # def get_url(url)
  #   response = conn.get(url) 
    
  #   JSON.parse(response.body, symbolize_names: true)
  # end
  # conn = Faraday.new(url: "https://api.nal.usda.gov")
  # response = conn.get("/fdc/v1/foods/search") do |request|
  #   request.params[:query] = search_term
  #   request.params[:api_key] = ENV["FOOD_API"]
  # end
end