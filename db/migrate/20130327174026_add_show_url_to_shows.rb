class AddShowUrlToShows < ActiveRecord::Migration
  def change
    add_column :shows, :show_url, :string
  end
end
