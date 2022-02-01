class MoviesController < ApplicationController
  before_action :authenticate_user!
  def show
    @movie = MovieService.find_by_api_id(params["id"])
  end
  
  def new
  end
  
  def create
    @movie = Movie.new(movie_params)
  end

  def popular
    @movies = MovieService.popular
  end

  def search_by_title
    query = params[:name]

    if query.present? 
      @movies = MovieService.title_search(query)
      render 'search_results'
    else
      redirect_to '/movies/search'
    end
  end

  def search
    render 'search'
  end
  
  #def search_results
  #end
  
  private
  
  def movie_params
    params.require(:movie).permit(:api_id, :name, :image_url)
  end
end
