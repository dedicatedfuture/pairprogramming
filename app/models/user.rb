class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :active_appointments, class_name:  "Appointment",
                                  foreign_key: "mentee_id",
                                  dependent:   :destroy
  
  has_many :passive_appointments, class_name:  "Appointment",
                                  foreign_key: "mentor_id",
                                  dependent:   :destroy


  #Appointments where user is the mentee                              
  has_many :mentee_appointments, through: :active_appointments, source: :mentor

  #Appointments where user is the mentor
  has_many :mentor_appointments, through: :passive_appointments, source: :mentee

  has_many :skills, through: :user_skills, dependent: :destroy
  has_many :user_skills

  has_one :profile, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :availabilities
  
  


  
def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
   end
end
end
