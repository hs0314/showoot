class Weather
  def self.get_current_weather
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?id=524901&APPID=9470ef016a30a1dd8fe2e39a52be2097&q=seoul&units=metric", headers: {"APPID" => "9470ef016a30a1dd8fe2e39a52be2097"}).parsed_response
    if response["main"]
      return response["main"]
    else
      return -1
    end
  end
end
