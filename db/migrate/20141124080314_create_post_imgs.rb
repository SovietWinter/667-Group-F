class CreatePostImgs < ActiveRecord::Migration
  def change
    create_table :post_imgs do |t|
      t.string :image
      t.string :post_id

      t.timestamps null: false
    end
  end
end
