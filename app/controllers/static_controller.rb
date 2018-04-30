class StaticController < ApplicationController
  include ApplicationHelper

  def index
    respond_to do |format|
      format.html
      format.js
    end
    @weather = get_weather
  end
end
