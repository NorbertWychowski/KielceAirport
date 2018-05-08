class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.references :flight, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :payment, foreign_key: true
      t.references :book_status, foreign_key: true
      t.references :ticket, foreign_key: true
    end
  end
end
