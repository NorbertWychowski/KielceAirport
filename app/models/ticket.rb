class Ticket < ApplicationRecord
  belongs_to :flight
  belongs_to :discount_type
  belongs_to :baggage
  belongs_to :customer
end
