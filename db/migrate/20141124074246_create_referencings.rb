class CreateReferencings < ActiveRecord::Migration
  def change
    create_table :referencings do |t|
      t.integer :post_id
      t.integer :reference_id

      t.timestamps null: false
    end
  end
end
