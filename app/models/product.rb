class Product < ApplicationRecord
  validates :artist, :spotify_id, :name, presence: true
  # has_many :reviews, dependent: :destroy
  validates :spotify_id, uniqueness: true
end
