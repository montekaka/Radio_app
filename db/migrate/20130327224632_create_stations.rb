class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.text   :description, :limit => nil
      t.string :station_url

      t.timestamps
    end
  end
end
