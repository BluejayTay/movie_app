# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reviews
  has_many :watch_list_movies
  has_many :movies, through: :watch_list_movies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username

  def add_to_watchlist(movie)
    watch_list_movies.create(user_id: id, movie_id: movie.id, priority: 3)
  end
end
