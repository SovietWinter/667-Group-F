class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag

      t.timestamps null: false
    end

    create_table :post_tags do |t|
      t.string :post_id
      t.string :tag_id

      t.timestamps null: false
    end
  end
end
