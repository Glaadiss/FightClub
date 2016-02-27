class FightsController < ApplicationController
	def index
		@fights = Fight.all
	end

	def show
		@fight = Fight.find(params[:id])
	end

	def new
		@fight = Fight.new
	end

	def create
		fight(params[:fight][:first_id], params[:fight][:second_id])
	end

end
