class UserAccount < ApplicationRecord
  has_one :airline
  belongs_to :user_type
  belongs_to :person
end
