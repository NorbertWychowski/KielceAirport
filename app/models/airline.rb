class Airline < ApplicationRecord
  has_many :flights
  belongs_to :user_account, optional: true
end
