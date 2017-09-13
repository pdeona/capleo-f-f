class Playlist < ApplicationRecord
  belongs_to :user

  validates :spotify_uri, presence: true
end
