class CreateBookmarkings < ActiveRecord::Migration
  def change
    create_table :bookmarkings do |t|
      t.string :user
      t.string :post

      t.timestamps null: false
    end
  end
end
