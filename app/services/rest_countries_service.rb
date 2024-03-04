class RestCountriesService

  def self.get_countries
    conn = Faraday.new(url: "https://restcountries.com")
    response = conn.get("/v3.1/all")
    
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_random_country
    countries = get_countries
    random_country = countries.sample
    random_country[:name][:common]
  end

  def self.get_country_capital_latlon(q)
    conn = Faraday.new(url: "https://restcountries.com")
    response = conn.get("/v3.1/name/#{q}?fullText=true") # <-- sneaky, sneaky
    parsed_response = JSON.parse(response.body, symbolize_names: true).first
    capital_latlon = parsed_response[:capitalInfo][:latlng]
    # lat = capital_latlon[0]
    # lon = capital_latlon[1]
  end
end