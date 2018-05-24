class RegistrationMailer < ApplicationMailer
  default from: 'from@example.com'

  def registration_confirmation(host, user, locale)
    @user = user
    @customer = Customer.find_by(person_id: @user.id)
    mail(to: @user.email, subject: 'Welcome to Kielce Airport')
  end
end
