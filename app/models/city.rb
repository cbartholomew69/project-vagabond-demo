class City < ApplicationRecord
  has_many :posts, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
end
