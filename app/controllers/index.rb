require 'json'

get '/' do
  # p ENV["GIANTBOMB_ACCESS_KEY"]
  erb :'/index.html'
end

post '/' do
  url = "http://www.giantbomb.com/api/search/?api_key=#{ENV["GIANTBOMB_ACCESS_KEY"]}&format=json&query=\"#{params["query"]}\""
  if request.xhr?
    response = HTTParty.get( url )
    response.to_json
  else
    "This will have the show for the given game"
  end
end

get '/login' do 
end