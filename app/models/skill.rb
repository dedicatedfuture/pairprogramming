class Skill < ActiveRecord::Base
  has_many :users, through: :user_skills, dependent: :destroy
  has_many :user_skills
end
