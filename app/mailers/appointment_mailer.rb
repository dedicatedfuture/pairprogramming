class AppointmentMailer < ActionMailer::Base

  default :from => 'no-reply@example.com',
          :subject => 'An email sent via SendGrid with substitutions'

  def confirmation_email(email)
    category 'SendGridRocks'
    mail :to => email
  end
end
