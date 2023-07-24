module Api 
    class WeatherController < ActionController::API 
        def weather_info
            weather = Rails.cache.read 'weather_info'
            unless weather
                url = 'https://api.open-meteo.com/v1/forecast?latitude=50.0413&longitude=21.999&hourly=temperature_2m'
                weather = HTTParty.get(url)
                Rails.cache.write 'weather_info', weather, expires_in: 1.minute
            end
            render json: weather
        end
    end
end
