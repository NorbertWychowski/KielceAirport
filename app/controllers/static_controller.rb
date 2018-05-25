class StaticController < ApplicationController
  def index
    countries = Airport.joins(city: :country).select('countries.name as name, COUNT(countries.name) as count').group('countries.name')
    @countries = countries.collect {|country| [country.name, country.count]}

    @news = News.last
    unless @news.nil?
      @content = @news.content[0..(@news.content.index('.'))]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def registration_confirm
    @email = params[:email]
  end
end
