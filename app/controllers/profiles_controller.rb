class ProfilesController < ApplicationController

  def new

    @profile = Profile.new
    
    @skill = Skill.new
    
  end

  def show
    @currentprofile = get_profile
    @profile = Profile.find(User.find(params[:id]).profile)
    @appointment = Appointment.new

  end



  def edit
    @skill = Skill.new
    @availability = Availability.new()
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
      redirect_to root_path, notice: "Profile updated."
    else
      render :new, alert: "There was a problem."
    end
  end

 

  private

   def availability_params
      
      params.require(:availability).permit(:dow, :start, :end, :user_id)
    end


  def get_profile
    current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:fname, :lname, :bio, :workexp, :teachexp, :skillexp, :skype ).merge(user_id: current_user.id)
  end
end
