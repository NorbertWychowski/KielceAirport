class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :first_name
      t.string :last_name
      t.float :price
      t.references :customers, foreign_key: true
      t.references :discount_type, foreign_key: true
      t.references :flight, foreign_key: true
      t.references :baggages, foreign_key: true
    end
  end
end
