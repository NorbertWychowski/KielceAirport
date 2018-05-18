class CreateBaggages < ActiveRecord::Migration[5.1]
  def change
    create_table :baggages do |t|
      t.string :name
      t.float :price
    end
  end
end
