class StaticController < ApplicationController
  def index
    @flights_incoming = Flight.joins(:airport, :flight_status)
                            .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name')
                            .where(flight_type_id: 2, flight_status_id: 3)
                            .limit(5)

    @flights_outgoing = Flight.joins(:airport, :flight_status)
                            .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name')
                            .where(flight_type_id: 1, flight_status_id: 3)
                            .limit(5)

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
