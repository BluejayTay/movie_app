class ReviewsController < ApplicationController
  def index
    @reviews = current_user.reviews.all
  end
  def show
    @review = Review.find(params[:id])
  end
  def new
    @review = Review.new
    render 'review/new'
  end
  def create
  end
  def update
  end
  def destroy
  end
end
