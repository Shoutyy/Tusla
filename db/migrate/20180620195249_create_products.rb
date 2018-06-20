class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.integer :price
      t.string :description
      t.integer :stock

      t.timestamps
    end
  end
end
