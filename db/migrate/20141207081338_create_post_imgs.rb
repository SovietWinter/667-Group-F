class CreatePostImgs < ActiveRecord::Migration
  def change
    create_table :post_imgs do |t|
      t.integer :post_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
