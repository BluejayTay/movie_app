# frozen_string_literal: true

class WatchListMoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_watch_list_movie, only: [:update, :destroy]

  def index
    @watch_list_movies = current_user.watch_list_movies.order(priority: :desc)
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

    flash[:notice] = 'Movie successfully added to your watchlist!'
    redirect_back(fallback_location: watch_list_movies_path(user_id: current_user.id))
  end

  def update
    redirect_back(fallback_location: root_path) if @watch_list_movie.update(watch_list_movie_params)
  end

  def destroy
    @watch_list_movie.destroy
    flash[:notice] = 'Movie successfully removed from watchlist!'
    redirect_back(fallback_location: root_path)
  end

  private
  
  def set_watch_list_movie
    @watch_list_movie = WatchListMovie.find(params[:id])
  end

  def movie_params
    params.require(:watch_list_movie).permit(:api_id, :name, :image_url)
  end

  def watch_list_movie_params
    params.require(:watch_list_movie).permit(:priority)
  end
end
