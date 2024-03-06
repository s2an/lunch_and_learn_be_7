class YoutubeService
  
  def self.get_video_from_youtube(q)
    get_uri("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{q}")
  end

  def self.get_uri(path)
    response = conn.get(path) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn #5
    Faraday.new(url: "https://youtube.googleapis.com") do |faraday|
      faraday.params[:key] = Rails.application.credentials.youtube[:key]
    end
  end
end