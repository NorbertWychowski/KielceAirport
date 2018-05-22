class TicketsController < ApplicationController
  def index
    if params[:airport] and !params[:airport].empty? and
        params[:dep_date] and !params[:dep_date].empty? and
        params[:dep_date] and !params[:tickets_count].empty?
      airport_cond = " and (LOWER(airports.name) LIKE LOWER('%#{params[:airport]}%') or LOWER(cities.name) LIKE LOWER('%#{params[:airport]}%'))"
      dep_date_cond = " and DATE(flights.dep_date) > DATE('#{params[:dep_date]}')"
      tickets_count_cond = "COUNT(tickets.id) - 1 + #{params[:tickets_count]}"
      @flights = Flight.left_joins(:tickets).joins(:airline, :airplane, :airport, airport: :city)
                     .select('flights.*, airports.name as airport_name, airplanes.seats as seats, cities.name as city_name, ' +
                                 'airlines.name as airline_name, COUNT(tickets.id) as tickets_count')
                     .where("flights.dep_date > ?" + airport_cond + dep_date_cond, Time.now)
                     .group(:flights)
                     .having("#{tickets_count_cond} < seats")
                     .order('flights.dep_date ASC')
                     .page(params[:page]).per(10)
    end
    respond_to do |format|
      format.js {render index: {index: @flights, query: [params[:airport], params[:dep_date], params[:tickets_count]]}}
      format.html {render :index}
    end
  end
end
