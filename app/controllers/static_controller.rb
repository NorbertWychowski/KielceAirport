class StaticController < ApplicationController
  def index
    @news = News.last
    unless @news.nil?
      @content = @news.content[0..(@news.content.index('.'))]
    end
  end

  def search
    
  end

  def registration_confirm
    @email = params[:email]
  end
end
