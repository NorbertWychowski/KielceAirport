class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :card_number, default: ''
      t.integer :year, default: 0
      t.integer :month, default: 0
      t.integer :cvv, default: 000
      t.string :confirm_token, default: ''
      t.boolean :email_confirmed, default: false
      t.references :person, foreign_key: true
    end
  end
end
