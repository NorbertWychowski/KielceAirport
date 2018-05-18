class FlightsController < ApplicationController
  def index
    @flights_incoming = Flight.joins(:airport, :flight_status, :airline)
                            .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name, airlines.name as airline_name')
                            .where(flight_type_id: 2, flight_status_id: 3, dep_date: Time.now..Float::INFINITY)
                            .page(params[:id] == 'flightsArrivals' ? params[:page] : 1).per(20)
                            .order(dep_date: :asc)

    @flights_outgoing = Flight.joins(:airport, :flight_status, :airline)
                            .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name, airlines.name as airline_name')
                            .where(flight_type_id: 1, flight_status_id: 3, dep_date: Time.now..Float::INFINITY)
                            .page(params[:id] == 'flightsDepartures' ? params[:page] : 1).per(20)
                            .order(dep_date: :asc)
    @current_tab = cookies[:tab]
  end

  def search
    @flights = Flight.search(params[:search]).page(params[:page]).per(25)
    respond_to do |format|
      format.js {render search: {search: @flights, query: params[:search]}}
      format.html {render :search}
    end
  end
end
