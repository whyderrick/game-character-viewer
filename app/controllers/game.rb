require_relative '../models/game_adapter'

post '/games' do
	formatted_string = params["query"].gsub(" ","%20")
  url = "http://www.giantbomb.com/api/search/?api_key=#{ENV["GIANTBOMB_ACCESS_KEY"]}&format=json&query=%22#{formatted_string}%22&resource=game"
  query_result = HTTParty.get( url )["results"][0]
  detail_url = query_result["api_detail_url"] + "?api_key=5bdc35028bf40863d05e54f4fc4895e3956878d0&format=json"
  p detail_url
  game_data = HTTParty.get( detail_url )["results"]
  # p game_data
  prepped_data = GiantBombAdapter::Game.parse(game_data)
  p "*" * 200 + "Prepped Data" + "*" * 200

  p prepped_data
  @game = Game.new(prepped_data)
  # @show_data = @giantbomb_data["results"][0]
  if request.xhr?
    erb :'game/_show.html'
  else
    "This will have the show for the given game"
  end
end
