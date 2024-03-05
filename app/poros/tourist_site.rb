class TouristSite
  attr_reader :id, :type, :name, :address, :place_id

  def initialize(features)
    @id = nil
    @type =  "tourist_site",
    @name = features[:properties][:name]
    @address = features[:properties][:formatted]
    @place_id = features[:properties][:place_id]
  end
end