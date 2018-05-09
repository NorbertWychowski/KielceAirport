class Flight < ApplicationRecord
  has_many :bookings
  belongs_to :airline
  belongs_to :airplane
  belongs_to :airport
  belongs_to :flight_type
  belongs_to :flight_status

  default_scope {order("id ASC")}

  def has_empty_seats?
    bookings.size < airplane.seats
  end

  def self.search(params)
    if params.nil? or params.empty?
      joins(:airport, :flight_status, :airline, :flight_type)
          .select('flights.*, airports.name as airport_name, flight_statuses.name as flight_status_name, ' +
                      'airlines.name as airline_name, flight_types.name as flight_type_name')
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
          .where([(['(cast(flights.id as char) LIKE ? OR airports.name LIKE ? OR flight_statuses.name LIKE ? or airlines.name LIKE ? or flight_types.name LIKE ?)'] * search_length)
                      .join(' AND ')] + binded_values)
    end
  end
end
