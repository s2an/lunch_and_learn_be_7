class PexelsService
  
  def self.get_images_from_pexels(q)
    get_uri("/v1/search?query=#{q}&per_page=10")
  end

  def self.get_uri(path)
    response = conn.get(path) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn #5
    Faraday.new(url: "https://api.pexels.com") do |faraday|
      faraday.headers[:Authorization] = Rails.application.credentials.pexels[:Authorization]
    end
  end
end