class StaticController < ApplicationController
  include ApplicationHelper

  def index
    @weather = get_weather
    @location = request.location.city
  end
end
