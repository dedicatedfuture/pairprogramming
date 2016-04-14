class SkillController < ApplicationController

  def new
    @skill = Skill.new
  end

  def show
    @skill = Skill.where(user_id: params[:id]).first
  end

  def edit
    @skill = get_profile
  end

  def create
    @skill = Skill.create(skill_params)
    current_user.profile = @profile
    redirect_to profile_path(current_user)
  end

  def update
    user = current_user
    if user.profile.skill.update(skill_params)
      redirect_to profile_path(current_user), notice: "Profile updated."
    else
      render :new, alert: "There was a problem."
    end
  end

  private

  def get_skills
    current_user.skill.all
  end

  def skill_params
    params.require(:skills).permit(:skill).merge(user_id: current_user.id)
  end
end
