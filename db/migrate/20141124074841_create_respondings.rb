class CreateRespondings < ActiveRecord::Migration
  def change
    create_table :respondings do |t|
      t.integer :post_id
      t.integer :responds_to_id

      t.timestamps null: false
    end
  end
end
