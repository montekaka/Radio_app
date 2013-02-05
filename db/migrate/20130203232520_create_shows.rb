class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :djname

      t.timestamps
    end
  end
end
