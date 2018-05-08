class Ticket < ApplicationRecord
  has_many :bookings
  belongs_to :discount_type
end
