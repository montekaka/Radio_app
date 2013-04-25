class CreateAudioposts < ActiveRecord::Migration
  def change
    create_table :audioposts do |t|
      t.integer :user_id
      t.string :title
      t.text   :short_note, :limit => nil
      t.string :audio
      t.date :audio_date

      t.timestamps
    end
  end
end
