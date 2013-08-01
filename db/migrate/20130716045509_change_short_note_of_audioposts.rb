class ChangeShortNoteOfAudioposts < ActiveRecord::Migration
  def up
    change_column :audioposts, :short_note, :text, :limit => nil
  end

  def down
    change_column :audioposts, :short_note, :text
  end
end
