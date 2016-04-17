class SkillsController < ApplicationController

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
    puts "PUTS PAR: #{params}"
    @skill = Skill.create(skill_params)
    @user = User.find(params[:user_id])
    @user.skills.push @skill
    # current_user.profile = @profile
    redirect_to new_user_profile_path(current_user)

  end

  def update
    user = current_user
    if user.profile.skill.update(skill_params)
      redirect_to profile_path(current_user), notice: "Profile updated."
    else
      render :new, alert: "There was a problem."
    end
  end

  def destroy
     @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to edit_user_profile_path
  end


  private

  def get_skills
    current_user.skill.all
  end

  def skill_params
    params.require(:skill).permit(:skill)
  end
end
