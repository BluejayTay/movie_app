# frozen_string_literal: true

class WatchListMoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_watch_list_movie, only: %i[update destroy]

  def index
    @watch_list_movies = current_user.watch_list_movies.order(priority: :desc)
  end

  def new
    @watch_list_movie = WatchListMovie.new
  end

  def create
    movie = Movie.find_or_create_by(movie_params)

    if current_user.add_to_watchlist(movie)
      flash[:notice] = 'Movie successfully added to your watchlist!'
    else
      flash[:alert] = 'Hmm, something went wrong. Please try again.'
    end

    redirect_back(fallback_location: watch_list_movies_path(user_id: current_user.id))
  end

  def update
    if @watch_list_movie.update(watch_list_movie_params)
      flash[:notice] = 'Movie successfully updated in watchlist!'
    else
      flash[:alert] = 'Update unsuccessful. Please make sure a priority level is selected and try again.'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    if @watch_list_movie.destroy
      flash[:notice] = 'Movie successfully removed from watchlist!'
    else
      flash[:alert] = 'Removing from watchlist was unsuccessful. Please try again.'
    end

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
