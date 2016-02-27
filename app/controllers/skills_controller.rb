class SkillsController < ApplicationController
  before_action :find_skill, only: [:show, :edit, :update, :destroy, :delete]

  def index
  	@skills = Skill.all
  end

  def show
  end

  def edit
  end

  def new
  	@skill = Skill.new
  end

  def create
  	@skill = Skill.new(skill_params)
  	if @skill.save
  		flash[:success] = "Skill added"
  		redirect_to skills_path
  	else
  		render('new')
  	end
  end

  private

  def skill_params
  	params.require(:skill).permit(:name, :level)
  end

  def find_skill
  	@skill = Skill.find(params[:id])
  end
end
