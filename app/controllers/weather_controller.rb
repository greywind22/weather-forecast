class WeatherController < ApplicationController
  def index
    @locations = Location.all
  end

  def forecast
    @location = Location.find(params[:location_id])
    uri = URI(@location.url)

    req = Net::HTTP::Get.new(uri)

    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true
    response = http.request(req)
    parsed = JSON.parse(response.body)
    puts 'parsed'
    puts parsed
  end
end
