class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :genre
      t.integer :price
      t.boolean :statut

      t.timestamps
    end
  end
end
