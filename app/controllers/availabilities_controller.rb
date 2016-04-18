class AvailabilitiesController < ApplicationController

	def index
		@availabilities = current_user.availabilities
	end

	def create
	@availability = Availability.new(availability_params)

    respond_to do |format|
      if @availability.save
        format.html { redirect_to root_path, notice: 'Availability was successfully created.' }
        format.json { render :index, status: :created, location: @availability }
      else
        format.html { render :new }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
	end

	def show
    
    @availability = Availability.find(params[:id])
    @availabilities = Availability.all

    


	end

	def edit
	end

	def update
	respond_to do |format|
      if @availability.update(availability_params)
        format.html { redirect_to @availability, notice: 'Availability was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability }
      else
        format.html { render :edit }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
     @availability = Availability.find(params[:id])
	@availability.destroy
    respond_to do |format|
      format.html { redirect_to availabilities_url, notice: 'Availability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def new
    @availability = Availability.new
  end
  
  def currentuserjson

    @availabilities = current_user.availabilities

    #filter out availability from appts
    
    @avail_json = []
    @availabilities.as_json.each do |avail|
      avail["dow"] = [avail["dow"]]
      @avail_json.push avail
    end

    render json: @avail_json

  end  

  def otheruserjson

    @availabilities = User.find(params[:user_id]).availabilities
    # @availabilities = current_user.availabilities
    #filter out availability from appts
    
    @avail_json = []
    @availabilities.as_json.each do |avail|
      avail["dow"] = [avail["dow"]]
      @avail_json.push avail
    end

    render json: @avail_json

  end



    private
    def set_availability
      @availability = Availability.find(params[:id])
    end

    def availability_params
      
      params.require(:availability).permit(:dow, :start, :end, :user_id)
    end


	
end
