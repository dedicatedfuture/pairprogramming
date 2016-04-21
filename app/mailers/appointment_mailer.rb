class AppointmentMailer < ActionMailer::Base

  default :from => 'no-reply@example.com',
          :subject => 'Pair Up! Someone wants to pair with you!'

  def confirmation_email(user, requestuser)
    category 'SendGridRocks'
    @user = user
    @requestuser = requestuser
    mail :to => user.email
  end
end

