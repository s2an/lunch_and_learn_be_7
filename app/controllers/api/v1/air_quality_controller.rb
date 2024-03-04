class Api::V1::AirQualityController < ApplicationController
    
  def show
    render json: AirQualitySerializer.new(AirQualityFacade.get_air_quality(country_capital))
  end

end