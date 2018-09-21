class HomeController < ApplicationController
  def index
    response = HTTParty.get("https://api.darksky.net/forecast/#{ENV['dark_sky']}/37.8267,-122.4233")
    @weather_data = format_data(response)
  end

  private

    def format_data(data)
      {
        city_state: 'Chicago',
        current_time: format_time(data['currently']['time']),
        current_temp: format_temp(data['currently']['temperature']),
        current_condition: data['currently']['summary'],
        feels_like: format_temp(data['currently']['apparentTemperature']),
        uv_index: data['currently']['uvIndex'],
        high_temp: format_temp(data['daily']['data'][0]['temperatureHigh']),
        low_temp: format_temp(data['daily']['data'][0]['temperatureLow'])
      }
    end

    def format_time(time)
      time = Time.at(time).strftime('%I:%M:%S %p')
    end

    def format_temp(temp)
      temp = temp.round
    end

end
