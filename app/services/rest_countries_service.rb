class RestCountriesService

  def self.get_countries
    conn = Faraday.new(url: "https://restcountries.com")
    response = conn.get("/v3.1/all")
    
    JSON.parse(response.body, symbolize_names: true)
  end
end