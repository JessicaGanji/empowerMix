class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :year
      t.string :title
      t.string :artist
      t.string :genre
      t.string :link

      t.timestamps null: false
    end
  end
end
