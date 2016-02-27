class FightsController < ApplicationController
	def index
		@fights = Fight.order('created_at DESC')
	end

	def show
		@fight = Fight.find(params[:id])
	end

	def new
		@fight = Fight.new
	end

	def create
		fight(params[:fight][:first_id], params[:fight][:second_id])
		if @fight.save
			redirect_to @fight
		else
			flash[:danger] = "Fighter can't fight with yourself!"
			redirect_to new_fight_path
		end
	end

end
