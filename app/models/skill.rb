class Skill < ActiveRecord::Base
	has_many :profiles, through: :user_skill
end
