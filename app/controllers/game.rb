post '/games' do
  url = "http://www.giantbomb.com/api/search/?api_key=#{ENV["GIANTBOMB_ACCESS_KEY"]}&format=json&query=\"#{params["query"]}\"&resource=game"
    @giantbomb_data = HTTParty.get( url )
    @show_data = @giantbomb_data["results"][0]
  if request.xhr?
    erb :'game/_show.html'
  else
    "This will have the show for the given game"
  end
end
