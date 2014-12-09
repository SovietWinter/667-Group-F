class RemoveProfPicFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :prof_pic, :string
  end
end
