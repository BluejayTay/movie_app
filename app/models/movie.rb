class Movie < ApplicationRecord
  has_many :reviews
  has_many :users, through: :watch_list_movies
end
