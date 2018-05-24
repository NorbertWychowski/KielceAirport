payment_config = Rails.application.config_for :payment

Rails.application.configure do
  config.payment = ActiveSupport::OrderedOptions.new
  config.payment.auth_url = payment_config['auth_url']
  config.payment.api_url = payment_config['api_url']
  config.payment.notify_url = payment_config['notify_url']
  config.payment.client_id = payment_config['client_id']
  config.payment.client_secret = payment_config['client_secret']
  config.payment.second_key = payment_config['second_key']
  config.payment.pos_id = payment_config['pos_id']
end