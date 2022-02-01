class WatchListMoviesController < ApplicationController
  before_action :authenticate_user!

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
    flash[:notice] = "Movie successfully added to your watchlist!"
    redirect_to movie_path(id: movie.api_id)
  end
  
  def destroy
    @watch_list_movie = WatchListMovie.find(params[:id])
    @watch_list_movie.destroy
    flash[:notice] = "Movie successfully removed from watchlist!"
    redirect_to watch_list_movies_path
  end

  private

  def movie_params
    params.require(:watch_list_movie).permit(:api_id, :name, :image_url)
  end
end
