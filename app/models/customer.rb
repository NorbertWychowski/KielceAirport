class Customer < ApplicationRecord
  belongs_to :person

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save
  end

  def update_data(params)
    unless params[:customer].nil?
      self.update(customer_params(params))
    end
    unless params[:person].nil?
      self.person.update(self.person.person_params(params))
    end
  end

  def customer_params(params)
    params.require(:customer).permit(:card_number, :year, :month, :cvv)
  end
end
