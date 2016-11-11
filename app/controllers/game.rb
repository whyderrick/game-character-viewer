require_relative '../models/game_adapter'

post '/games' do
	formatted_string = params["query"].gsub(" ","%20")
  url = "http://www.giantbomb.com/api/search/?api_key=#{ENV["GIANTBOMB_ACCESS_KEY"]}&format=json&query=%22#{formatted_string}%22&resource=game"
  query_result = HTTParty.get( url )["results"][0]
  detail_url = query_result["api_detail_url"] + "?api_key=#{ENV["GIANTBOMB_ACCESS_KEY"]}&format=json"
  game_data = HTTParty.get( detail_url )["results"]
  prepped_data = GiantBombAdapter::Game.parse(game_data)
  p prepped_data
  @game = Game.new(prepped_data)
  if request.xhr?
    erb :'game/_show.html'
  else
    "This will have the show for the given game"
  end
end
