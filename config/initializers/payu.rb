payu_config = Rails.application.config_for :payu

Rails.application.configure do
  config.payu = ActiveSupport::OrderedOptions.new
  config.payu.auth_url = payu_config['auth_url']
  config.payu.api_url = payu_config['api_url']
  config.payu.notify_url = payu_config['notify_url']
  config.payu.client_id = payu_config['client_id']
  config.payu.client_secret = payu_config['client_secret']
  config.payu.second_key = payu_config['second_key']
  config.payu.pos_id = payu_config['pos_id']
end