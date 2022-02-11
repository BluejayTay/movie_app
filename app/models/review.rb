class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_uniqueness_of :user_id, scope: :movie_id
  validates :rating, presence: true
end
