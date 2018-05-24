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
      ticket_params.to_h.each do |_, value|
        d = value[:discount_type].to_i - 1
        b = value[:baggage].to_i - 1
        @total_price += value[:price] = (@flight.ticket_price * discount_type[d][:value] + baggage[b][:price]).round(2)
        value[:discount] = discount_type[d][:name]
        value[:baggage_n] = baggage[b][:name] + " - %.02fzł" % baggage[b][:price].round(2)
        @tickets << value
      end
    end
  end

  def create
    tickets = []
    create_ticket_params(params).to_h.each do |_, value|
      ticket = Ticket.new(email: params[:ticket][:email],
                          customer_id: params[:ticket][:customer],
                          flight_id: params[:ticket][:flight],
                          first_name: value[:first_name],
                          last_name: value[:last_name],
                          price: value[:price],
                          discount_type_id: value[:discount_type].to_i,
                          baggage_id: value[:baggage].to_i)
      ticket.save
    end
  end

  def ticket_pdf
    @ticket = Ticket.find(params[:id])
    @flight = @ticket.flight

    pdf = render_to_string pdf: 'Ticket',
                           template: 'tickets/ticket_pdf.html.erb',
                           layout: 'ticket',
                           viewport_size: '1280x1024'

    save_path = Rails.root.join('public', 'test.pdf')
    File.open(save_path, 'wb') do |file|
      file << pdf
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Ticket',
               template: 'tickets/ticket_pdf.html.erb',
               layout: 'ticket',
               viewport_size: '1280x1024'
      end
    end
  end

  def ticket_params
    params[:tickets].try(:permit!)
  end

  def create_ticket_params(params)
    params.require(:ticket)[:tickets].try(:permit!)
  end
end
