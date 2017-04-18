class Like < ApplicationRecord
  # validate :comment_or_artwork

  belongs_to :likeable, polymorphic: true

  belongs_to :user

  private



end
