class LearningResourceSerializer
  include JSONAPI::Serializer
  
  attribute :id
  attribute :type
  attribute :attributes do |object|
    object.attributes
  end
end