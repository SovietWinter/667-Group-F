class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :title
      t.text :content
      t.datetime :created_at
      t.integer :num_recommends
      t.string :topic

      t.timestamps null: false
    end
  end
end
