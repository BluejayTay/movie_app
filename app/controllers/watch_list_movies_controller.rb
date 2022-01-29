class WatchListMoviesController < ApplicationController
  #require signed in before actions w/devise
  def index
    @watch_list_movies = current_user.watch_list_movies
  end
  def new
    @watch_list_movie = WatchListMovie.new
  end
  def create
    binding.pry
    movie = Movie.find_or_create_by(params[:api_id])
    current_user.add_to_watchlist(movie)
    respond_to do |format|
        format.html
        format.json
    end
  end
  
  def destroy
  end
 
end
