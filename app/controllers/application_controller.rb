class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  	def fight(first,second)
		if !first
			redirect_to root_path
		else
			@fight = Fight.new
			@fight.first_id = first
			@fight.second_id = second

			sum = 0
			sum2 = 0
			fighter = Fighter.find(first)
			expo = Fight.where(winner: first).count*3
			expo+= Fight.where(draw: first).count
			expo+= Fight.where(draw2: first).count
			sum+= expo
			fighter.skills.each do |skill|
				sum+= skill.level
			end

			fighter2 = Fighter.find(second)
			expo = Fight.where(winner: second).count*3
			expo+= Fight.where(draw: second).count
			expo+= Fight.where(draw2: second).count	
			sum2+=expo
			fighter2.skills.each do |skill|
				sum2+= skill.level
			end

			if sum==sum2 
				@fight.draw = first;
				@fight.draw2 = second;
			elsif sum>sum2
				@fight.winner = first;
				@fight.lost = second;
			else
				@fight.winner = second;
				@fight.lost = first;
			end

			@fight.save
			redirect_to @fight  

		end

	end
end
