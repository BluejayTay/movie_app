class Movie < ApplicationRecord
  has_many :reviews
  has_many :watch_list_movies
  has_many :users, through: :watch_list_movies
  validates :name, :image_url, :api_id, presence: true

end
