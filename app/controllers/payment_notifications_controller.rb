class PaymentNotificationsController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    require 'cgi'
    require 'digest'

    head 200

    config = Rails.configuration.payment
    body = request.body.read

    incoming_signature = CGI::parse(request.headers[:HTTP_OPENPAYU_SIGNATURE])['signature'].first
    expected_signature = Digest::MD5.hexdigest(body.to_s + config[:second_key])

    puts params[:order][:status]

    if incoming_signature == expected_signature
      case params[:provider]
        when 'payu'
          if params[:order][:status] == "COMPLETED"
            order = Order.find_by(order_id: params[:order][:orderId])
            if order.nil?
              order = Order.new(order_id: params[:order][:orderId])
              order.save
              ticket = {email: params[:order][:buyer][:email],
                        flight: params[:flight],
                        tickets: []}
              ticket[:customer] = params[:customer] unless params[:customer].blank?
              ticket[:order] = order.id
              params[:order][:products].each {|t| ticket[:tickets] << eval(t[:name])}

              tickets = Ticket.create_ticket(ticket)
              pdfs = []
              tickets.each do |t|
                qr = RQRCode::QRCode.new(t.id.to_s, size: 4, level: :h)
                render(pdf: "BILET - #{t.flight.airport.name} - #{t.flight.dep_date}",
                       template: 'tickets/ticket_pdf.html.erb',
                       save_to_file: Rails.root.join('public', 'tickets', "#{t.id}.pdf"),
                       save_only: true,
                       layout: 'ticket',
                       locals: {ticket: t, flight: t.flight, airport: t.flight.airport, qr: qr})
                pdfs << {name: "BILET - #{t.flight.airport.name} - #{t.flight.dep_date}",
                         path: Rails.root.join('public', 'tickets', "#{t.id}.pdf")}
              end
              TicketMailer.send_ticket(pdfs, ticket[:email], request, params[:locale]).deliver
            end
          end
      end
    end
  end
end
