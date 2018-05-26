class TicketMailer < ApplicationMailer
  default from: 'from@example.com'

  def send_ticket(tickets, email, request, locale)
    @tickets = tickets
    @host = request.host_with_port
    @locale = locale
    tickets.each do |ticket|
      attachments["#{ticket[:name]}.pdf"] = File.read(ticket[:path], mode: 'rb')
    end
    mail(to: email, subject: 'Bilety')
  end
end
