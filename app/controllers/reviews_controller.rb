class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = current_user.reviews.order(created_at: :desc)
  end

  def new
    @review = Review.new
    @movie_api_id = params[:api_id]
  end

  def create
    @movie = Movie.find_or_create_by(movie_params)
    
    review_creation_params = review_params.merge(user_id: current_user.id, movie_id: @movie.id)
    Review.create!(review_creation_params)
    
    respond_to do |format|
      format.html
      format.json
    end

    redirect_back(fallback_location: movie_path(id: @movie.api_id))
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    
    if @review.update(review_params)
      flash[:notice] = "Review successfully edited!"
      redirect_to reviews_path
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully deleted!"
    redirect_to reviews_path
  end
  
  private

  def movie_params
    params.require(:review).permit(:api_id, :name, :image_url)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  
end
