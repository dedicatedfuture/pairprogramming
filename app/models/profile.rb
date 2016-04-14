class Profile < ActiveRecord::Base
	validates :fname, presence: :true
	validates :lname, presence: :true
	validates :bio, presence: :true
	belongs_to :user
	has_many :skills, through: :user_skills, dependent: :destroy
end
