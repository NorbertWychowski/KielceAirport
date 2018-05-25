class PaymentNotificationsController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    require 'cgi'
    require 'digest'

    config = Rails.configuration.payment
    body = request.body.read

    incoming_signature = CGI::parse(request.headers[:HTTP_OPENPAYU_SIGNATURE])['signature'].first
    expected_signature = Digest::MD5.hexdigest(body.to_s + config[:second_key])

    puts params[:order][:status]

    if incoming_signature == expected_signature
      case params[:provider]
        when 'payu'
          if params[:order][:status] == "COMPLETED"
            ticket = {email: params[:order][:buyer][:email],
                      flight: params[:flight],
                      tickets: []}
            ticket[:customer] = params[:customer] unless params[:customer].blank?
            params[:order][:products].each {|t| ticket[:tickets] << eval(t[:name])}

            Ticket.create_ticket(ticket)
          end
        else
          # type code here
      end
    end

    head 200
  end
end
