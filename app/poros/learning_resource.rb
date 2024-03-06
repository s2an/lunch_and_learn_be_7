class LearningResource
  attr_reader :id, :type, :country, :video, :images

  def initialize(q, video, images)
    @id = nil
    @type = "learning_resource"
    @country = q.to_s.downcase
    @video = video
    @images = images
  end
end

# {
#     "data": {
#         "id": null,
#         "type": "learning_resource",
#         "attributes": {
#             "country": "laos",
#             "video": {
#                 "title": "A Super Quick History of Laos",
#                 "youtube_video_id": "uw8hjVqxMXw"
#             },
#             "images": [
#                 {
#                     "alt_tag": "standing statue and temples landmark during daytime",
#                     "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
#                 },
#                 {
#                     "alt_tag": "five brown wooden boats",
#                     "url": "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwyfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
#                 },
#                 {
#                     "alt_tag": "orange temples during daytime",
#                     "url": "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwzfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
#                 },
#                 {...},
#                 {...},
#                 {...},
#                 {etc},
#               ]
#         }
#     }
# }