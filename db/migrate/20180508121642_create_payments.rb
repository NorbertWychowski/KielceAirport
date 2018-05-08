class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.datetime :payment_date
      t.float :total_price
    end
  end
end
