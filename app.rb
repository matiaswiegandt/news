require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

get "/" do
  ### Get the weather
  # Location coordinates Mexico City
  lat = 19.4285
  long = -99.1277

  units = "metric" # or metric, whatever you like
  key = "56f0fae8b46b369153726b699847f5a6" # replace this with your real OpenWeather API key

  # construct the URL to get the API data (https://openweathermap.org/api/one-call-api)
  url = "https://api.openweathermap.org/data/2.5/onecall?lat=19.4285&lon=-99.1277&units=metric&appid=56f0fae8b46b369153726b699847f5a6"

  # make the call
  @forecast = HTTParty.get(url).parsed_response.to_hash

  ### Get the news
  url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bc1285fae9364f739780a27f9c8d0f39"

# make the call
@news = HTTParty.get(url).parsed_response.to_hash

  ## link to the html that will popo up on browser... if im not mistaken
  view "news"
end

#for day in forecast["daily"]
 # puts "A high of #{day["temp"]["max"]} and #{day["weather"][0]["main"]}"
#end

