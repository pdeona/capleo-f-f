class Product < ApplicationRecord
  validates :artist, :spotify_id, :name, presence: true

  def name=(name)
    self.name = Product.find_or_create_by(name: name) if name.present?
  end
end
