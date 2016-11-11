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
	end
end