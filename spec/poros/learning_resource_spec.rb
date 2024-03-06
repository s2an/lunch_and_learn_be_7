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
    expect(learning_resource.attributes[:country]).to eq(q.downcase)
    expect(learning_resource.attributes[:video]).to eq(video)
    expect(learning_resource.attributes[:images]).to eq(images)
  end
end