class CreateReadProgresses < ActiveRecord::Migration
  def change
    create_table :read_progresses do |t|
      t.string :post_id
      t.string :user_id
      t.integer :progress
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
