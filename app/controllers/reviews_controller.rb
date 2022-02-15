# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[edit update destroy]

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

    if Review.create(review_creation_params).save
      flash[:notice] = 'Review successfully created!'
    else
      flash[:alert] =
        'Review creation was unsuccessful. Please make sure content and rating are not blank and try again.'
    end

    redirect_back(fallback_location: movie_path(id: @movie.api_id))
  end

  def edit; end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Review successfully edited!'
      redirect_to reviews_path
    else
      flash[:alert] = 'Edit was unsuccessful. Please try again.'
      render 'edit'
    end
  end

  def destroy
    if @review.destroy
      flash[:notice] = 'Review successfully deleted!'
    else
      flash[:alert] = 'Delete was unsuccessful. Please try again.'
    end

    redirect_back(fallback_location: reviews_path)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def movie_params
    params.require(:review).permit(:api_id, :name, :image_url)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
