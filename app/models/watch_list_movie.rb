class WatchListMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  #validates :order, presence: true
end
