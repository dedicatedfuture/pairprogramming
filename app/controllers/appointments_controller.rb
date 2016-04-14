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
  

    @appointment = Appointment.create(appointment_params)
    puts @appointment.errors.full_messages
    redirect_to appointments_path

 
  end

  # PATCH/PUT /appointments/1
  
  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update_attributes(params[:appointment])
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
      params["appointment"]["start"] =  DateTime.strptime(params["appointment"]['start'], "%m/%d/%Y %I:%M").to_s
      params["appointment"]["end"] =  DateTime.strptime(params["appointment"]['end'], "%m/%d/%Y %I:%M").to_s
      params.require(:appointment).permit(:start, :end)
    end
end


