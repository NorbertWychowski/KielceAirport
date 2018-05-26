module TicketsHelper
  def self.ticket_pdf(ticket_id)
    require 'tempfile'

    ticket = Ticket.find(ticket_id)
    flight = ticket.flight
    airport = flight.airport

    pdf = ApplicationController.render pdf: "#{airport.name} - #{flight.dep_date}",
                                       template: 'ticket_mailer/ticket_pdf.html.erb',
                                       layout: 'ticket',
                                       viewport_size: '1280x1024',
                                       locals: {ticket: ticket, flight: flight, airport: airport}

    file = Tempfile.new(['ticket', '.pdf'])
    file.close
    file
  end
end
