class Api::V1::LearningResourcesController < ApplicationController
    
  def index #nevermind, index is good
    q = params[:country]
    render json: LearningResourceSerializer.new(LearningResourceFacade.get_resources_by_country(q))
  end

end