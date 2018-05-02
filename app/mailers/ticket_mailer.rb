class TicketMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email
    @user = 'tomaszwozniak96@gmail.com'
    mail(to: @user, subject: 'Welcome to Kielce Airport')
  end
end
