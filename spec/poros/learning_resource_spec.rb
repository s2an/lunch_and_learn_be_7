require "rails_helper"

RSpec.describe LearningResource do
  it "exists" do 
    q = "Ethiopia"

    video = { title: "video name", youtube_video_id: "1234" }
    images = [ { alt_tag: "desc", url: "https://" } ]

    learning_resource = LearningResource.new(q, video, images)
# require "pry"; binding.pry
    expect(learning_resource).to be_a(LearningResource)
    expect(learning_resource.id).to eq(nil)
    expect(learning_resource.type).to eq("learning_resource")
    expect(learning_resource.country).to eq(q.downcase)
    expect(learning_resource.video[:title]).to eq("video name")
    expect(learning_resource.video[:youtube_video_id]).to eq("1234")
    expect(learning_resource.images.first[:alt_tag]).to eq("desc")
    expect(learning_resource.images.first[:url]).to eq("https://")
  end
end