class CreateAirlines < ActiveRecord::Migration[5.1]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :user_account, index: {unique: true}, foreign_key: true
    end
  end
end
