class Skill < ActiveRecord::Base
	has_many :users, through: :user_skill
end
