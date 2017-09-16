class AddEmbedLinkToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :embed, :string
  end
end
