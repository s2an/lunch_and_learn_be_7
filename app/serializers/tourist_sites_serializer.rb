class TouristSitesSerializer
  include JSONAPI::Serializer

  attributes :name, :address, :place_id

  # set_id :id
  set_type :tourist_site 
end

# {
#     "data": [
#         {
#             "id": null,
#             "type": "tourist_site",
#             "attributes": {
#                 "name": "Tour de l'horloge",
#                 "address": "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
#                 "place_id": "51d28..."
#             }
#         },