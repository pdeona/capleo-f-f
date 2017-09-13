class Product < ApplicationRecord
  validates :artist, :spotify_uri, :name, presence: true
  has_many :reviews
end
