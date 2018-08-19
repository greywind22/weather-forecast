module Weather
  module Services
    class RetrieveData

      def initialize(location)
        @location = location
      end

      def call

        uri = URI(@location.url)

        req = Net::HTTP::Get.new(uri)

        http = Net::HTTP.new(uri.hostname, uri.port)
        http.use_ssl = true
        response = http.request(req)
        parsed = JSON.parse(response.body)

        weather_data = parsed['query']['results']['channel']

        units = weather_data['units']
        location = weather_data['location']
        wind = weather_data['wind']
        atmosphere = weather_data['atmosphere']
        today = weather_data['item']['condition']

        today_data = { date: DateTime.parse(today['date']).strftime('%e %B %Y, %H:%M'),
                       temperature: today['temp'] + + '°' + units['temperature'],
                       wind: wind['speed'] + ' ' + units['speed'],
                       humidity: atmosphere['humidity'] + '%',
                       text: today['text'],
                       location: location['city'] + ', ' + location['country']
                     }
        forecast_data = weather_data['item']['forecast'].drop(1).map do |f|
          f['high'] = f['high'] + '°' + units['temperature']
          f['low'] = f['low'] + '°' + units['temperature']
          f
        end

        { today: today_data, forecast: forecast_data }

      end
    end
  end
end
