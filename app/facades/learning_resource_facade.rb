class LearningResourceFacade
  def self.get_resources_by_country(q)
    video = YoutubeService.get_video_from_youtube(q)
    # videos = videos[:items]
    # video = videos.sample
    images = PexelsService.get_images_from_pexels(q)

    LearningResource.new(q, video, images)
  end
end
