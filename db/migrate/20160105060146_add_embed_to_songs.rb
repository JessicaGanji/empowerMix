class AddEmbedToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :embed, :string
  end
end
