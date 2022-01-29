class User < ApplicationRecord
  has_many :reviews
  has_many :watch_list_movies
  has_many :movies, through: :watch_list_movies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def add_to_watchlist(movie)
    order = (self.watch_list_movies.count + 1)
    self.watch_list_movies.create(user_id: self.id, movie_id: movie.id, order: order)
  end
end
