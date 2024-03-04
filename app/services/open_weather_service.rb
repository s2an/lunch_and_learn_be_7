class OpenWeatherService

  def get_air_quality_from_api(lat, lon)
      get_uri("/data/2.5/air_pollution?lat=#{lat}&lon=#{lon}")
  end

  def get_uri(path)
    response = conn.get(path) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://api.openweathermap.org") do |faraday|
      faraday.params[:appid] = Rails.application.credentials.open_weather[:appid]
    end
  end

end