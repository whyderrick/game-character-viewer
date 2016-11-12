module GiantBombAdapter
	class Game
		def self.parse( data )
			game = {}
			game[:title]       = data["name"]
			game[:description] = data["deck"]
			game[:image]       = data["image"]["small_url"]
			game[:franchise]   = data["franchises"][0]["name"]
			game[:platform]    = data["platforms"][0]["name"]
			return game
		end

		def self.get_game_data( query )
			url = "http://www.giantbomb.com/api/search/?api_key=#{ENV["GIANTBOMB_ACCESS_KEY"]}&format=json&query=%22#{query}%22&resource=game&field_list=api_detail_url"
			lead_query = HTTParty.get( url )["results"][0]

		  detail_url = lead_query["api_detail_url"] + "?api_key=#{ENV["GIANTBOMB_ACCESS_KEY"]}&format=json"
		  game_data = HTTParty.get( detail_url )["results"]
		  return game_data
		end
	end
end
