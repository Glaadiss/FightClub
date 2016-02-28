module ApplicationHelper

	# calculate experience for the fighter
	def exp(id)
		expo = Fight.where(winner: id).count*3
		expo+= Fight.where(draw: id).count
		expo+= Fight.where(draw2: id).count
		return expo
	end
	# calculate number of wins for the fighter
	def wins(id)
		wins = Fight.where(winner: id).count
		return wins
	end
	# calculate number of draws for the fighter
	def draws(id)
		draws = Fight.where(draw: id).count
		draws += Fight.where(draw2: id).count
		return draws
	end
	# calculate number of lost for the fighter
	def lost(id)
		lost = Fight.where(lost: id).count
		return lost
	end

	# position in the ranking
	def rank(id)
		fighters = Fighter.all.sort {|a,b| a.exp <=> b.exp}.reverse
		id = id
		position = fighters.map(&:id).index(id)
		return position + 1
	end
end
