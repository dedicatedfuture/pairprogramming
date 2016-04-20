class Appointment < ActiveRecord::Base
	validates :start, presence: :true
	validates :end, presence: :true
	validates :starttime, presence: :true
	validates :endtime, presence: :true

	
	belongs_to :mentor, class_name: "User" 
	belongs_to :mentee, class_name: "User"
	validate :appointment_date_cannot_be_in_the_past
    

  def appointment_date_cannot_be_in_the_past
    errors.add(:start, "can't be in the past") if
      !start.blank? and start < Date.today
  end







end
