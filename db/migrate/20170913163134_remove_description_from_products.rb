class RemoveDescriptionFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :description
  end
end
