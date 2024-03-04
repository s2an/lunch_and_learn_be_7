class Api::V1::RecipesController < ApplicationController
    
  def index
    render json: RecipeSerializer.new(RecipeFacade.get_recipes_by_country(params[:q]))
  end

end