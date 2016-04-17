class Appointment < ActiveRecord::Base
	validates :start, presence: :true
	validates :end, presence: :true
	has_many :users, through: :users_appointments
	has_many :users_appointments
end
