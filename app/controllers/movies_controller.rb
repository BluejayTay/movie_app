class MoviesController < ApplicationController
  def show
    @movie = Movie.find[params[:api_id]]
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
      #put flash message re:error
      redirect_to '/movies/search'
    end
  end
end
