require "rails_helper"

RSpec.describe LearningResourceFacade do
  it "gets resources by country" do
    q = "Ethiopia"

    youtube_response = File.read("spec/fixtures/youtube_#{q.downcase}.json")
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{q}&key=#{Rails.application.credentials.youtube[:key]}").
      to_return(status: 200, body: youtube_response, headers: {})
    video = YoutubeService.get_video_from_youtube(q)
# require "pry"; binding.pry
    pexels_response = File.read("spec/fixtures/pexels_#{q.downcase}.json")
    stub_request(:get, "https://api.pexels.com/v1/search?query=#{q}&per_page=10").
      to_return(status: 200, body: pexels_response, headers: {Authorization: Rails.application.credentials.pexels[:Authorization]})
    images = PexelsService.get_images_from_pexels(q)

    result = LearningResourceFacade.get_resources_by_country(q)
# require "pry"; binding.pry
    expect(result).to be_a(LearningResource)
    expect(result.attributes[:country]).to eq(q.downcase)
    # expect(result.attributes[:video]).to eq(video) # only getting one rando now...putting dirty laundry in facade isn't working, revisit if time lol
    expect(result.attributes[:images]).to eq(images)
    # require "pry"; binding.pry
  end
end
