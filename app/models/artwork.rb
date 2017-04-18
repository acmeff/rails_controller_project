class Artwork < ApplicationRecord
  validates :title, :artist_id, presence: true
  validates :image_url, presence: true, uniqueness: true
  validate :no_double_titles_for_one_user, on: :create

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'User'

  has_many :artwork_shares

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments, :dependent => :destroy
  has_many :likes, as: :likeable

  private

  def no_double_titles_for_one_user
    if Artwork.find_by(title: self.title, artist_id: self.artist_id)
      errors[:title] << "You already have something with that title."
    end
  end
end
