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
end