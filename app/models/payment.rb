class Payment < ApplicationRecord
  has_many :bookings
end
