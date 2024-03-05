require "rails_helper"

RSpec.describe PexelsService do
  it "YOUTUBE: connects to API" do
    q = "Ethiopia"

    youtube_response = File.read("spec/fixtures/youtube_#{q.downcase}.json")
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{q}&key=#{Rails.application.credentials.youtube[:key]}").
      to_return(status: 200, body: youtube_response, headers: {})

    results = YoutubeService.get_images
    
    expect(results).to be_an(Array)
    # expect(results).to have_key(:)
    # expect(results).to have_key(:)
    

  end
end