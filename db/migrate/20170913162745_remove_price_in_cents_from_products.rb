class RemovePriceInCentsFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :price_in_cents
    add_column :products, :artist, :string
    add_column :products, :spotify_uri, :string
  end
end
