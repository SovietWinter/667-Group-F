class CreatePostImgs < ActiveRecord::Migration
  def change
    create_table :post_imgs do |t|
      t.attachment :image
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
