module GiantBombAdapter
	class Game
		def parse( data )
			game = {}
			game[:title] = data["name"]
			game[:franchise] = data["francises"][0]
			game[:platform] = data["platforms"][0]
			game
		end
	end
end