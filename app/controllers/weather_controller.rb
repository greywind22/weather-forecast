class WeatherController < ApplicationController
  def index
    @locations = Location.all
  end

  def get_forecast

  end
end
