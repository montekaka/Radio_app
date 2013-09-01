class AddAttachmentSoundfileToAudioposts < ActiveRecord::Migration
  def self.up
    change_table :audioposts do |t|
      t.attachment :soundfile
    end
  end

  def self.down
    drop_attached_file :audioposts, :soundfile
  end
end
