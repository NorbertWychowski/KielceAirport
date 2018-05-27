class TicketsController < ApplicationController
  def index
    unless params[:airport].blank? or params[:dep_date].blank? or params[:dep_date].blank?
      @flights = Flight.search_ticket(params)
    end

    respond_to do |format|
      format.js {render index: {index: @flights, query: [params[:airport], params[:dep_date], params[:tickets_count]]}}
      format.html {render :index}
    end
  end

  def new
    if params[:flight].nil?
      redirect_to tickets_path
    else
      if params[:tickets]
        @tickets = []
        ticket_params.to_h.each do |_, value|
          @tickets << value
        end

        @tickets_count = @tickets.count
      else
        @tickets_count = params[:tickets_count].to_i
        if @tickets_count < 1
          @tickets_count = 1
        end
      end
    end
  end

  def summary
    @flight = Flight.find(params[:flight])

    if @flight.dep_date < Time.now or @flight.flight_status.name != "expected"
      redirect_to tickets_path
    else
      baggage = Baggage.all
      discount_type = DiscountType.all

      @tickets = []
      @total_price = 0.0
      @order = {products: []}
      ticket_params.to_h.each do |_, value|
        d = value[:discount_type].to_i - 1
        b = value[:baggage].to_i - 1
        @total_price += value[:price] = (@flight.ticket_price * discount_type[d][:value] + baggage[b][:price]).round(2)
        value[:discount] = discount_type[d][:name]
        value[:baggage_n] = baggage[b][:name] + " - %.02fzł" % baggage[b][:price].round(2)
        @tickets << value
        @order[:products] << {name: {first_name: value[:first_name],
                                     last_name: value[:last_name],
                                     price: value[:price],
                                     discount_type: value[:discount_type],
                                     baggage: value[:baggage]},
                              unitPrice: (value[:price] * 100).to_i.to_s,
                              quantity: "1"}
      end
      @order[:total_price] = (@total_price * 100).to_i
      @order[:email] = params[:email]
      @order[:flight] = @flight.id
      @order[:customer] = current_user.customer.id if loggen_in?
    end
  end

  def ticket_pdf
    require 'rqrcode'

    ticket = Ticket.find(params[:id])
    flight = ticket.flight
    airport = flight.airport
    qr = RQRCode::QRCode.new(ticket.id.to_s, size: 4, level: :h)

    TicketsController.create_ticket_pdf([ticket]) unless File.exists?(Rails.root.join('public', 'tickets', "#{ticket.id}.pdf"))

    respond_to do |format|
      format.html {render :ticket_pdf,
                          template: 'tickets/ticket_pdf.html.erb',
                          layout: 'ticket',
                          locals: {ticket: ticket, flight: flight, airpot: airport, qr: qr, type: 'html'}}
      format.pdf {send_file(Rails.root.join('public', 'tickets', "#{ticket.id}.pdf"),
                            filename: "Bilet - #{airport.name} #{flight.dep_date}.pdf",
                            type: :pdf,
                            stream: true,
                            buffer_size: 4096,
                            disposition: :inline)}
    end
  end

  def self.create_ticket_pdf(tickets)
    pdfs = []
    tickets.each do |t|
      flight = t.flight
      airport = flight.airport
      qr = RQRCode::QRCode.new(t.id.to_s, size: 4, level: :h)
      pdf = render pdf: "BILET - #{airport.name} - #{flight.dep_date}",
                   template: 'tickets/ticket_pdf.html.erb',
                   layout: 'ticket',
                   page_size: 'A4',
                   locals: {ticket: t, flight: flight, airport: airport, qr: qr, type: 'pdf'}

      File.open(Rails.root.join('public', 'tickets', "#{t.id}.pdf"), mode: 'wb') {|file| file << pdf}
      pdfs << {name: "BILET - #{airport.name} - #{flight.dep_date}",
               path: Rails.root.join('public', 'tickets', "#{t.id}.pdf")}
    end
    pdfs
  end

  def payment_confirm
  end

  def ticket_params
    params[:tickets].try(:permit!)
  end
end
