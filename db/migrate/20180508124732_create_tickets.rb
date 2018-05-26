class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.float :price
      t.references :customer, foreign_key: true
      t.references :discount_type, foreign_key: true
      t.references :flight, foreign_key: true
      t.references :baggage, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end
