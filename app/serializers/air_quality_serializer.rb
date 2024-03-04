class AirQualitySerializer
  include JSONAPI::Serializer
  
  attributes :id, :type, :attributes, :aqi, :datetime, :readable_aqi
end