class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.date :add_date
      t.string :image
    end
  end
end
