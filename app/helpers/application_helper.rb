module ApplicationHelper
  require 'open_weather'

  def get_weather
    options = {units: "metric", APPID: "9543b10cc8bd8c2eb67591813db9ad24", lang: "pl"}
    OpenWeather::Current.city_id("769250", options)
  end
end
