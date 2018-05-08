class Airport < ApplicationRecord
  has_many :flights
  belongs_to :city
end
