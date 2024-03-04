class RecipeSerializer
  include JSONAPI::Serializer
  
  attributes :id, :type, :title, :url, :country, :image
end