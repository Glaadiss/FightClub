module ApplicationHelper

	def exp(id)
		expo = Fight.where(winner: id).count*3
		expo+= Fight.where(draw: id).count
		expo+= Fight.where(draw2: id).count
		return expo
	end

	def wins(id)
		wins = Fight.where(winner: id).count
		return wins
	end

	def draws(id)
		draws = Fight.where(draw: id).count
		draws += Fight.where(draw2: id).count
		return draws
	end

	def lost(id)
		lost = Fight.where(lost: id).count
		return lost
	end
end
