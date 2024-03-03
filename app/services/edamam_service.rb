class EdamamService
  
  def conn #5
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.params[:type] = "public"
      # faraday.params[:q] = q
      faraday.params[:app_id] = Rails.application.credentials.edamam[:app_id]
      faraday.params[:app_key] = Rails.application.credentials.edamam[:app_key]
    end
    # response = conn.get
    # JSON.parse(response.body, symbolize_names: true)
  end
  
  def get_url(url)
    response = conn.get(url) 
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def recipe(q)
    get_url("/api/recipes/v2?q=#{q}")
  end
end