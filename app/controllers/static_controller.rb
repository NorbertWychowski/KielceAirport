class StaticController < ApplicationController
  include ApplicationHelper

  def index
    @weather = get_weather
    @news = News.last
    unless @news.nil?
      @content = @news.content[0..(@news.content.index('.'))]
    end
  end

  def registration_confirm
    @email = params[:email]
  end
end
