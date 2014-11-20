class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :real_name
      t.string :prof_pic
      t.string :blog_name
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
