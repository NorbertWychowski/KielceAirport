class CreateUserAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_accounts do |t|
      t.references :user_type, foreign_key: true
      t.references :person, index: {unique: true}, foreign_key: true
    end
  end
end
