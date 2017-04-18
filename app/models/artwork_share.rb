class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validate :only_one_share

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork

  private

  def only_one_share
    if ArtworkShare.find_by(artwork_id: self.artwork_id, viewer_id: self.viewer_id)
      errors[:artwork] << "You already shared that"
    end
  end
end
