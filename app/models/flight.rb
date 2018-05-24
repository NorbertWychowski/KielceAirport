class Flight < ApplicationRecord
  has_many :tickets
  belongs_to :airline
  belongs_to :airplane
  belongs_to :airport
  belongs_to :flight_type
  belongs_to :flight_status

  def has_empty_seats?
    tickets.size < airplane.seats
  end

  def self.search(params)
    if params.blank?
      joins(:airport, :flight_status, :airline, :flight_type)
          .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name, ' +
                      'airlines.name as airline_name, flight_types.name as flight_type_name')
          .order(dep_date: :asc)
    else
      binded_values = []
      params.split.map {|params| "%#{params}%"}.each do |f|
        5.times do
          binded_values.push f
        end
      end
      search_length = params.split.length
      joins(:airport, :flight_status, :airline, :flight_type)
          .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name, ' +
                      'airlines.name as airline_name, flight_types.name as flight_type_name')
          .where([(['(LOWER(flights.flight_identifier) LIKE LOWER(?) OR ' +
                        'LOWER(airports.name) LIKE LOWER(?) OR ' +
                        'LOWER(flight_statuses.name) LIKE LOWER(?) OR ' +
                        'LOWER(airlines.name) LIKE LOWER(?) OR ' +
                        'LOWER(flight_types.name) LIKE LOWER(?))'] * search_length).join(' AND ')] + binded_values)
          .order(dep_date: :asc)
    end
  end

  def self.search_ticket(params)
    airport_cond = " and (LOWER(airports.name) LIKE LOWER('%#{params[:airport]}%') or LOWER(cities.name) LIKE LOWER('%#{params[:airport]}%'))"
    dep_date_cond = " and DATE(flights.dep_date) > DATE('#{params[:dep_date]}')"
    tickets_count_cond = "COUNT(tickets.id) - 1 + #{params[:tickets_count]}"

    left_joins(:tickets).joins(:airline, :airplane, :airport, airport: :city)
        .select('flights.*, airports.name as airport_name, airplanes.seats as seats, cities.name as city_name, ' +
                    'airlines.name as airline_name, COUNT(tickets.id) as tickets_count')
        .where("flights.dep_date > ?" + airport_cond + dep_date_cond, Time.now)
        .group('flights.id')
        .having("#{tickets_count_cond} < seats")
        .order('flights.dep_date ASC')
        .page(params[:page]).per(10)
  end

  def self.flights_incoming
    Flight.joins(:airport, :flight_status)
        .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name')
        .where(flight_type_id: 1, flight_status_id: 3, dep_date: Time.now..Float::INFINITY)
        .limit(5)
        .order(dep_date: :asc)
  end

  def self.flights_outgoing
    Flight.joins(:airport, :flight_status)
        .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name')
        .where(flight_type_id: 2, flight_status_id: 3, dep_date: Time.now..Float::INFINITY)
        .limit(5)
        .order(dep_date: :asc)
  end
end
