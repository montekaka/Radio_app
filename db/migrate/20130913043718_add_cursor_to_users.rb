class AddCursorToUsers < ActiveRecord::Migration
  def change
  	    add_column :users, :cursor, :string
  end
end
