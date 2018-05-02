class StaticController < ApplicationController
  include ApplicationHelper

  def index
    @weather = get_weather
  end

  def registration_confirm
    @email = params[:email]
  end
end
