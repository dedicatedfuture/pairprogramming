class AppointmentMailer ActionMailer::Base
  default :from => 'no-reply@example.com',
          :subject => 'An email sent via SendGrid with substitutions'

  def confirmation_email
    category 'SendGridRocks'
    mail :to => 'zerega85@gmail.com'
  end
end
