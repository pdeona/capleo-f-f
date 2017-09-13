class Product < ApplicationRecord
  validates :description, :name, presence: true
  has_many :reviews
end
