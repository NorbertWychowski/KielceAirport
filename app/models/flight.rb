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
    if params.nil? or params.empty?
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
end
