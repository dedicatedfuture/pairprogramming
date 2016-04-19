class AppointmentsController < ApplicationController
	before_filter :authenticate_user!

  # GET /appointments
  
  def index

   if current_user && !current_user.profile
         redirect_to new_user_profile_path(current_user.id)
   end

   
    @posts = Post.all 
   
   
   
    
  end

  # GET /appointments/1
  
  def show
    @appointment = Appointment.find(params[:id])
     @currentprofile = get_profile

    @appointments = current_user.appointments
       end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
 
  def create
  puts "P ARE: #{params}"

    # current_user.appointments.push or UsersAppointments.create. TWO OF THESE

    @appointment = Appointment.create(appointment_params)

   

    puts @appointment.errors.full_messages
    puts "params #{params}"

    redirect_to user_profile_path(Appointment.last.mentor.id, Appointment.last.mentor.id)

 
  end

  # PATCH/PUT /appointments/1
  
  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update_attributes(appointment_params)
      redirect_to root_path, :notice => "Your appointment was successfully updated"
    else
      render 'edit'
    end
    
  end

  # DELETE /appointments/1
  
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to root_path
  end

  def currentuserjson
      @appointments = current_user.mentoring_appointments
    render json: @appointments 
  end


   def otheruserjson
    puts params
      @appointments = User.find(params[:user_id]).mentoring_appointments
    render json: @appointments 
  end

  def currentusermenteejson
      @appointments = current_user.menteeing_appointments
    render json: @appointments 
  end


   def otherusermenteejson
    puts params
      @appointments = User.find(params[:user_id]).menteeing_appointments
    render json: @appointments 
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      starttotal = params["appointment"]['start'] + params["appointment"]['starttime']
      endtotal = params["appointment"]['end'] + params["appointment"]['endtime']
     

     
      params["appointment"]["start"] =  DateTime.strptime(starttotal, "%m/%d/%Y%I:%M%p").to_s
      params["appointment"]["starttime"] = DateTime.strptime(params["appointment"]['starttime'], "%I:%M%p").to_s
      params["appointment"]["end"] =  DateTime.strptime(endtotal, "%m/%d/%Y%I:%M%p").to_s
      params["appointment"]["endtime"] = DateTime.strptime(params["appointment"]['endtime'], "%I:%M%p").to_s
      # DateTime.new(total)

      
     
        params.require(:appointment).permit(:title, :start, :starttime, :end, :endtime, :mentee_id, :mentor_id)

      
    end
end


