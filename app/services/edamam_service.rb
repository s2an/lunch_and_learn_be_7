class EdamamService

  def get_recipes_from_api(q)
    if q.blank? # <-- revisit after poro
      return { "data": [] } # <-- revisit after poro
    else
      get_uri("/api/recipes/v2?q=#{q}&type=public")
    end
  end

  def get_uri(path)
    response = conn.get(path) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn #5
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.params[:app_id] = Rails.application.credentials.edamam[:app_id]
      faraday.params[:app_key] = Rails.application.credentials.edamam[:app_key]
    end
  end

end