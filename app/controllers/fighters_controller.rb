class FightersController < ApplicationController
	before_action :find_fighter, only: [:edit,:show,:destroy,:delete,:update]

	def index
		@fighters = Fighter.all

	end

	def show

	end

	def new
		@fighter = Fighter.new
	end

	def create
		previous_fighter_id = Fighter.order("created_at").all.last
		if previous_fighter_id
			previous_fighter_id = previous_fighter_id.id
		end
		@fighter = Fighter.new(fighter_params)
		@fighter.save

		fighter_id = Fighter.order("created_at").last.id
		params[:fighter][:skill_ids].each do |skill_id| 
			Relation.create(fighter_id: fighter_id, skill_id: skill_id)
		end
		fight(previous_fighter_id,fighter_id)
	end

	def edit
	end

	def update
		@fighter = Fighter.update(fighter_params)
	end

	def destroy
		@fighter.destroy
		redirect_to root_path
	end

	private

	def fighter_params
		params.require(:fighter).permit(:firstname, :lastname, :description, :avatar)
	end

	def find_fighter
		@fighter = Fighter.find(params[:id])
	end



end

