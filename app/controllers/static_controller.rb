class StaticController < ApplicationController
  include ApplicationHelper

  def index
    @weather = get_weather
    @news = News.first
    @content = @news.content[0..(@news.content.index('.') - 1)]
  end

  def registration_confirm
    @email = params[:email]
  end
end
