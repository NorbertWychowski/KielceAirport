class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :country, default: ''
      t.string :city, default: ''
      t.string :street, default: ''
      t.string :provider, default: ''
      t.string :uid, default: ''
    end
  end
end
