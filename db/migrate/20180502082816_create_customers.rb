class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :card_number
      t.integer :year
      t.integer :month
      t.integer :cvv
      t.string :confirm_token
      t.boolean :email_confirmed, default: false
      t.references :person, foreign_key: true
    end
  end
end
