class AddPaperclipToUsers < ActiveRecord::Migration
  def change
  	add_attachment :users, :prof_pic
  end
end
