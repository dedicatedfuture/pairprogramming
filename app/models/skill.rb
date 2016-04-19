class Skill < ActiveRecord::Base
  has_many :users, through: :user_skills, dependent: :destroy
  has_many :user_skills


def self.search(search)
  where("skill LIKE ?", "%#{search}%") 
end


# def self.search(search)
#   if search
#     find(:skill, :conditions => ['name LIKE ?', "%#{search}%"])
#   else
#     # find(:skill)
#   end
# end
end
