class Person < ApplicationRecord
  has_secure_password
  has_many :customers
  has_many :user_accounts

  attr_accessor :password_digest_confirmation
  validates_confirmation_of :password_digest

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.password_digest ||= BCrypt::Password.create(SecureRandom.urlsafe_base64.to_s)
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.save!

      @customer = Customer.find_by(person_id: user.id)

      if @customer
        @customer.email_confirmed = true
        @customer.confirm_token = nil
        @customer.save
      else
        @customer = Customer.new(email_confirmed: true, person_id: user.id)
        @customer.save
      end
    end
  end
end
