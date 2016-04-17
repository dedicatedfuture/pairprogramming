class AvailabilitiesController < ApplicationController

	def index
		@availabilities = Availability.all
	end

	def create
	@availability = Availability.new(availability_params)

    respond_to do |format|
      if @availability.save
        format.html { redirect_to @availability, notice: 'Availability was successfully created.' }
        format.json { render :show, status: :created, location: @availability }
      else
        format.html { render :new }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
	end

	def show
    
    @availability = Availability.find(params[:id])
    @availabilities = Availability.all

    json.array!(@availabilities) do |avail|
      json.extract! avail, :id, :start, :end, :dow
      json.dow [avail.dow]
      json.url event_url(avail, format: :html)

    end


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
  

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability
      @availability = Availability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_params
      params[:dow] = [params[:dow]]
      params.require(:availability).permit(:dow, :start, :end, :user_id)
    end


	
end
