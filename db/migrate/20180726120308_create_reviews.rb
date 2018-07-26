class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    drop_table :reviews

    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
