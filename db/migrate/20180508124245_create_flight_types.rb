class CreateFlightTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :flight_types do |t|
      t.string :name
    end
  end
end
