class Comment < ApplicationRecord
  validates :user_id, :artwork_id, :body, presence: true

  belongs_to :user
  belongs_to :artwork
  has_many :likes, as: :likeable
end
