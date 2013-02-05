class AddShowIdToAudioposts < ActiveRecord::Migration
  def change
    add_column :audioposts, :show_id, :integer
  end
end
