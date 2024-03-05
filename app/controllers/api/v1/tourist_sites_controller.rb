class Api::V1::TouristSitesController < ApplicationController

  def index
    country = params[:country]
    capital_latlon = self.class.get_country_capital_latlon(country)
    tourist_sites = self.class.get_tourist_sites(capital_latlon)
    # require "pry"; binding.pry
    render json: { data: tourist_sites }, status: 200
  end

  # service
  def self.get_country_capital_latlon(country)
    conn = Faraday.new(url: "https://restcountries.com")
    response = conn.get("/v3.1/name/#{country}?fullText=true")
    parsed_response = JSON.parse(response.body, symbolize_names: true).first
    capital_latlon = parsed_response[:capitalInfo][:latlng]

    return capital_latlon
  end

  def self.get_tourist_sites(capital_latlon)
    conn = Faraday.new(url: "https://api.geoapify.com")
    response = conn.get("v2/places?categories=tourism.sights&bias=proximity:#{capital_latlon[1]},#{capital_latlon[0]}&limit=10")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
  end
end