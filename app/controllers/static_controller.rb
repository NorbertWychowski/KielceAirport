class StaticController < ApplicationController
  include ApplicationHelper

  def index
    @weather = get_weather
  end
end
