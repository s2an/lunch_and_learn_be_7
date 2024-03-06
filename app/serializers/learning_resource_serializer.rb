class LearningResourceSerializer
  include JSONAPI::Serializer
  
  set_type :learning_resource

  attribute :country do |poro|
    poro.country.downcase
  end

  attribute :video do |poro|
    # require "pry"; binding.pry
    # poro.video.map do |vid|
    if poro.video.present?
      {
        title: poro.video[:snippet][:title],
        youtube_video_id: poro.video[:id][:videoId]
      }
    else
      {}
    end
    # end
    # require "pry"; binding.pry
  end

  attribute :images do |poro|
    if poro.images[:photos].present?

      # require "pry"; binding.pry
      poro.images[:photos].map do |photo|
        {
          alt_tag: photo[:alt],
          url: photo[:url]
        }
      end
    else
      []
    end
  end
end