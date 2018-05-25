class Ticket < ApplicationRecord
  belongs_to :flight
  belongs_to :discount_type
  belongs_to :baggage
  belongs_to :customer, optional: true

  def self.create_ticket(params)
    params[:tickets].each do |value|
      ticket = Ticket.new(email: params[:email],
                          customer_id: params[:customer],
                          flight_id: params[:flight],
                          first_name: value[:first_name],
                          last_name: value[:last_name],
                          price: value[:price],
                          discount_type_id: value[:discount_type].to_i,
                          baggage_id: value[:baggage].to_i)
      ticket.save
    end
  end
end
