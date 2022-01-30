class WatchListMoviesController < ApplicationController
  #require signed in before actions w/devise
  def index
    @watch_list_movies = current_user.watch_list_movies
  end

  def new
    @watch_list_movie = WatchListMovie.new
  end

  def create
    movie = Movie.find_or_create_by(movie_params)
    current_user.add_to_watchlist(movie)
    respond_to do |format|
        format.html
        format.json
    end
  end
  
  def destroy
  end

  private

  def movie_params
    params.require(:watch_list_movie).permit(:api_id, :name, :image_url)
  end
end
