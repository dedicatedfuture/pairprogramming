class UsersAppointment < ActiveRecord::Base
	belongs_to :user 
	belongs_to :appointment 
end
