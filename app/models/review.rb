# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_uniqueness_of :user_id, scope: :movie_id
  validates :rating, presence: true
  validates :content, length: { maximum: 570,
                                too_long: '570 characters is the maximum allowed' }
end
