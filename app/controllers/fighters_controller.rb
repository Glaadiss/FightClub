require 'will_paginate/array' 

class FightersController < ApplicationController
	before_action :find_fighter, only: [:edit,:show,:destroy,:delete,:update]
	before_action :add_default, only: [:new]

	def index
		## Sort by experience points
		fighters = Fighter.all.sort {|a,b| a.exp <=> b.exp}.reverse
		@fighters = fighters.paginate(:page => params[:page], :per_page => 5)

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

		##  checking whether user check at least 3 skills and no more than 8 # # 		
		@fighter = Fighter.new(fighter_params)
		n =-1;
		params[:fighter][:skill_ids].each do |skill_id| 
			n+=1
		end
		if n<3
			flash[:danger] = "You must check at least 3 skills"
			redirect_to new_fighter_path
		elsif n>8
			flash[:danger] = "You must check no more than 8 skills"
			redirect_to new_fighter_path
		else
		#######

			if @fighter.save
				fighter_id = Fighter.order("created_at").last.id

				## Add relationships between fighter and skill for each checked skill. 
				params[:fighter][:skill_ids].each do |skill_id| 
					Relation.create(fighter_id: fighter_id, skill_id: skill_id)
				end
				#######

				## If exist at least 2 fighters, do fight between 2 previously added fighters.
				if previous_fighter_id
					fight(previous_fighter_id,fighter_id)
					@fight.save
				end
				#######
				flash[:succes] = "Fighter added"
				redirect_to @fighter
			else
				render('new')
			end
		end
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

	def add_default
		if Skill.all.empty?
            add_default_skills
        end
	end



end

