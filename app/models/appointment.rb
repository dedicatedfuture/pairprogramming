class Appointment < ActiveRecord::Base
	has many :users, through: :users_appointments
end
