class AddCastRemoteUrlToAudioposts < ActiveRecord::Migration
  def change
    add_column :audioposts, :cast_remote_url, :string
  end
end
