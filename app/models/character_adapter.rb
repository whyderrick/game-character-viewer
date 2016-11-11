module GiantBombAdapter
	class Character
		def parse( data )
			character = {}
			character[:name] = data["name"]
			# Needs finessing to produce an actual relational link instead of what's present.
			character[:first_appearance_id] = data["first_appeared_in_game"]
		end

		private

		# How in the hell do I effecively send this message across classes, 
		# from here in character over to the game class?
		def find_game_id( title )

		end
	end
end