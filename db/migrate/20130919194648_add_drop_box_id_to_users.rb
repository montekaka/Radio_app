class AddDropBoxIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :dropbox_id, :string
  end
end
