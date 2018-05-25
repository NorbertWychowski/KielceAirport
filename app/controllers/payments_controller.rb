class PaymentsController < ApplicationController
  def create
    case params[:provider]
      when 'payu'
        payu(params[:ticket])
      else
        redirect_to root_path
    end
  end

  private
  def payu(params)
    require 'net/http'
    require 'uri'

    order = eval(params[:order])

    config = Rails.configuration.payment
    param = {grant_type: 'client_credentials',
             client_id: config['client_id'],
             client_secret: config['client_secret']}

    ret = Net::HTTP.post_form(URI.parse(config['auth_url']), param)
    @access_token = JSON.parse(ret.body)['access_token']

    headers = {'Content-Type' => 'application/json',
               :Authorization => "Bearer #{@access_token}"}

    products = []
    order[:products].each do |f|
      products << {name: "#{f[:name]}", unitPrice: f[:unitPrice], quantity: f[:quantity]}
    end

    uri = URI("#{config['api_url']}/orders")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.path, headers)
    req['Content-Type'] = 'application/json'
    req.body = {
        :notifyUrl => payment_notification_url(host: request.host, flight: order[:flight], customer: order[:customer], provider: 'payu'),
        :continueUrl => payment_confirm_url(host: request.host, price: order[:total_price] / 100.0, email: order[:email]),
        :merchantPosId => config['pos_id'],
        :description => 'Kielce Airport',
        :currencyCode => 'PLN',
        :totalAmount => order[:total_price],
        :customerIp => request.remote_ip,
        :settings => {:invoiceDisabled => 'true'},
        :products => products,
        :buyer => {
            email: order[:email]
        }
    }.to_json

         res = http.request(req)
    puts res.body
    redirect_to JSON.parse(res.body)['redirectUri']
  end
end
