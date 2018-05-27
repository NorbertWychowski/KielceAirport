paypal_config = Rails.application.config_for :paypal

Rails.application.configure do
  config.paypal = ActiveSupport::OrderedOptions.new
  config.paypal.client_id = paypal_config['client_id']
  config.paypal.client_secret = paypal_config['client_secret']
  config.paypal.mode = paypal_config['mode']
end