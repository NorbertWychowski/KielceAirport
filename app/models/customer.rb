class Customer < ApplicationRecord
  belongs_to :person
  has_many :tickets

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save
  end
end
