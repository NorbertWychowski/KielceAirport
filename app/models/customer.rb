class Customer < ApplicationRecord
  has_many :bookings
  belongs_to :person

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save
  end
end
