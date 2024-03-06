class Api::V1::LearningResourcesController < ApplicationController
    
  def index # need to change back to a show!!!!!!!
    q = params[:country]
    render json: LearningResourceSerializer.new(LearningResourceFacade.get_resources_by_country(q))
  end

end