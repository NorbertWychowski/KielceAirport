class CreateFlightStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :flight_statuses do |t|
      t.string :name
    end
  end
end
