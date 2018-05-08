class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :customer
  belongs_to :payment
  belongs_to :book_status
  belongs_to :ticket
end
