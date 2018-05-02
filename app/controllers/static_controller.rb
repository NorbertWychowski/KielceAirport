class StaticController < ApplicationController
  include ApplicationHelper

  def index
    puts Rails.configuration.action_mailer.smtp_settings
    @weather = get_weather
  end
end
