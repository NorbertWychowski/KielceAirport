class StaticController < ApplicationController
  include ApplicationHelper

  def index
    @weather = get_weather
    @news = News.last
    @content = @news.content[0..(@news.content.index('.'))] unless @news.nil?
  end

  def registration_confirm
    @email = params[:email]
  end
end
