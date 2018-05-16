class Ticket < ApplicationRecord
  belongs_to :flight
  belongs_to :discount_type
end
