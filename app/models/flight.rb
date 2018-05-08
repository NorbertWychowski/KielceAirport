class Flight < ApplicationRecord
  has_many :bookings
  belongs_to :airline
  belongs_to :airplane
  belongs_to :airport
  belongs_to :flight_type
  belongs_to :flight_status

  def has_empty_seats?
    bookings.size < airplane.seats
  end
end
