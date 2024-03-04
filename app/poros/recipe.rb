class Recipe
  attr_reader :id, :type, :title, :url, :country, :image

  def initialize(attrs, q)
    @id = nil
    @type = "recipe"
    @title = attrs[:label]
    @url = attrs[:url]
    @country = q.to_s.downcase
    @image = attrs[:image]
  end
end