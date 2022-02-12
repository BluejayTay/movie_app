class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_uniqueness_of :user_id, scope: :movie_id
  validates :rating, presence: true
  validates :content, length: { maximum: 570,
    too_long: "%{count} characters is the maximum allowed" }
end
