class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :dep_date
      t.datetime :arr_date
      t.references :airline, foreign_key: true
      t.references :airplane, foreign_key: true
      t.references :airport, foreign_key: true
      t.references :flight_type, foreign_key: true
      t.references :flight_status, foreign_key: true
    end
  end
end
