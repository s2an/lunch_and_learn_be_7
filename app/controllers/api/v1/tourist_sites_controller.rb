class Api::V1::TouristSitesController < ApplicationController

  # service
  def self.get_country_capital_latlon(country)
    conn = Faraday.new(url: "https://restcountries.com")
    response = conn.get("/v3.1/name/#{country}?fullText=true")
    parsed_response = JSON.parse(response.body, symbolize_names: true).first
    capital_latlon = parsed_response[:capitalInfo][:latlng]

    return capital_latlon
  end
end