class CreateRespondings < ActiveRecord::Migration
  def change
    create_table :respondings do |t|
      t.string :post_id
      t.string :responds_to_id

      t.timestamps null: false
    end
  end
end
