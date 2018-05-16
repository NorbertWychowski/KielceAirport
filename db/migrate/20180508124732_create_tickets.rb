class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.float :price
      t.references :discount_type, foreign_key: true
      t.references :flight, foreign_key: true
    end
  end
end
