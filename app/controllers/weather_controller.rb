class WeatherController < ApplicationController
  def index
    @locations = Location.all
  end

  def forecast
    @location = Location.find(params[:location_id])

    result = Weather::Services::RetrieveData.new(@location).call
    @today = result[:today]
    @forecast = result[:forecast]
    puts @today
  end
end
