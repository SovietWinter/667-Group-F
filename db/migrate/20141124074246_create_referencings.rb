class CreateReferencings < ActiveRecord::Migration
  def change
    create_table :referencings do |t|
      t.string :post_id
      t.string :reference_id

      t.timestamps null: false
    end
  end
end
