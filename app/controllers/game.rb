require_relative '../models/game_adapter'

get '/games/:id' do
	@game = Game.find(params[:id])
	erb :'game/_show.html'
end

post '/games' do
	formatted_string = params["query"].gsub(" ","%20")
  gb_result = GiantBombAdapter::Game.get_game_data( formatted_string )
  prepped_data = GiantBombAdapter::Game.parse(gb_result)
  @game = Game.new(prepped_data)
  if request.xhr?
    erb :'game/_show.html'
  else
    "This will have the show for the given game"
  end
end

post '/games/new' do
	game =   params["game"]
	Game.create(game)
	redirect to "/users/1"
end

get '/users/:id' do
	@games = Game.all
	erb :"user_show"
end
