class ProfilesController < ApplicationController

  def new

    @profile = Profile.new
    
    @skill = Skill.new
    
  end

  def show
    @profile = Profile.where(user_id: params[:id]).first
  end

  def edit
    @skill = Skill.new

    @profile = get_profile

  end

  def create
    @profile = Profile.create(profile_params)
    current_user.profile = @profile
    redirect_to root_path
  end

  def update
    user = current_user
    if user.profile.update(profile_params)
      redirect_to profile_path(current_user), notice: "Profile updated."
    else
      render :new, alert: "There was a problem."
    end
  end

  private

  def get_profile
    current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:fname, :lname, :bio, :workexp, :teachexp, :skillexp ).merge(user_id: current_user.id)
  end
end
