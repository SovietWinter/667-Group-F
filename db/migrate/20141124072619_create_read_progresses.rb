class CreateReadProgresses < ActiveRecord::Migration
  def change
    create_table :read_progresses do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :progress
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
