class WatchListMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :priority, presence: true
  validates_uniqueness_of :user_id, scope: :movie_id
end
