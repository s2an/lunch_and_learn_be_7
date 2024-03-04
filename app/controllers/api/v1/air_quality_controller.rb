class Api::V1::AirQualityController < ApplicationController
    
  def show
    country = params[:country]
    lat = RestCountriesService.get_country_capital_latlon(country).first
    lon = RestCountriesService.get_country_capital_latlon(country).last
    # render json: AirQualitySerializer.new(AirQualityFacade.get_air_quality(country_capital))
    render json: response, status: 200
  end

  def index
    country = params[:country]
    lat = RestCountriesService.get_country_capital_latlon(country).first
    lon = RestCountriesService.get_country_capital_latlon(country).last
    # render json: AirQualitySerializer.new(AirQualityFacade.get_air_quality(country_capital))
    render json: response, status: 200
  end
end