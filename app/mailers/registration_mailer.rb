class RegistrationMailer < ApplicationMailer
  default from: 'from@example.com'

  def registration_confirmation(user, request, locale)
    @user = user
    @customer = Customer.find_by(person_id: @user.id)
    @host = request.host_with_port
    @locale = locale
    mail(to: @user.email, subject: 'Welcome to Kielce Airport')
  end
end
