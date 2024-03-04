class RecipeFacade

  def self.get_recipes_by_country(q)
    if q.blank?
      q = RestCountriesService.get_random_country
      service = EdamamService.new.get_recipes_from_api(q)

      return service[:hits].map { |hit| Recipe.new(hit[:recipe], q) }
    else
      service = EdamamService.new.get_recipes_from_api(q)

      return service[:hits].map { |hit| Recipe.new(hit[:recipe], q) }
    end
  end
end