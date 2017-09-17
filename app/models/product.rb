class Product < ApplicationRecord
  validates :artist, :spotify_id, :name, presence: true
  # has_many :reviews, dependent: :destroy
end
