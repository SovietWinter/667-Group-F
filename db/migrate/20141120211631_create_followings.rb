class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.string :user_id
      t.string :follow_id

      t.timestamps null: false
    end
  end
end
