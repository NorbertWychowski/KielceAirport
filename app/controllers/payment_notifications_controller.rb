class PaymentNotificationsController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    require 'cgi'
    require 'digest'

    head 200

    config = Rails.configuration.payment
    body = request.body.read

    case params[:provider]
      when 'payu'
        incoming_signature = CGI::parse(request.headers[:HTTP_OPENPAYU_SIGNATURE])['signature'].first
        expected_signature = Digest::MD5.hexdigest(body.to_s + config[:second_key])

        if incoming_signature == expected_signature
          puts params[:order][:status]

          if params[:order][:status] == "COMPLETED"
            order = Order.find_by(order_id: params[:order][:orderId])
            if order.nil?
              order = Order.new(order_id: params[:order][:orderId])
              if order.save
                ticket = {email: params[:order][:buyer][:email],
                          flight: params[:flight],
                          tickets: []}
                ticket[:customer] = params[:customer] unless params[:customer].blank?
                ticket[:order] = order.id
                params[:order][:products].each {|t| ticket[:tickets] << eval(t[:name])}

                tickets = Ticket.create_ticket(ticket)
                pdfs = TicketsController.create_ticket_pdf(tickets)
                TicketMailer.send_ticket(pdfs, ticket[:email], request, params[:locale]).deliver
              end
            end
          end
        end
    end
  end
end
