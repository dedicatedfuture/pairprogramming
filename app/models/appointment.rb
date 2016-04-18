class Appointment < ActiveRecord::Base
	validates :start, presence: :true
	validates :end, presence: :true
	validates :starttime, presence: :true
	validates :endtime, presence: :true
	
	belongs_to :mentor, class_name: "User" 
	belongs_to :mentee, class_name: "User"
end
