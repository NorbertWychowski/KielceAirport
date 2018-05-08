class CreateDiscountTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :discount_types do |t|
      t.string :name
      t.float :value
    end
  end
end
