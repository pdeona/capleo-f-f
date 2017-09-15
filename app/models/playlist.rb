class Playlist < ApplicationRecord
  belongs_to :user

  validates :spotify_uri, :name, presence: true
end
