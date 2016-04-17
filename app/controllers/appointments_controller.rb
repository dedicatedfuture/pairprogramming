class AppointmentsController < ApplicationController
	before_filter :authenticate_user!

  # GET /appointments
  
  def index

   if current_user && !current_user.profile
         redirect_to new_user_profile_path(current_user.id)
   end
    @appointments = Appointment.all

   
    
  end

  # GET /appointments/1
  
  def show
    @appointment = Appointment.find(params[:id])
    @appointments = Appointment.all
    render json: @appointments 
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

    @appointment = Appointment.create(appointment_params)
    puts @appointment.errors.full_messages
    puts "params #{params}"
    redirect_to appointments_path

 
  end

  # PATCH/PUT /appointments/1
  
  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update_attributes(appointment_params)
      redirect_to appointments_path, :notice => "Your appointment was successfully updated"
    else
      render 'edit'
    end
    
  end

  # DELETE /appointments/1
  
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
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
     
      params.require(:appointment).permit(:title, :start, :starttime, :end, :endtime)
    end
end


