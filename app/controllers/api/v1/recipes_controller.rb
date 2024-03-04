class Api::V1::RecipesController < ApplicationController
    
  def index
    render json: RecipeSerializer.new(Recipe.all)
  end
  
  # def show
  #   render json: RecipeSerializer.new(Recipe.find(id: params[:id])) 
  # end

end