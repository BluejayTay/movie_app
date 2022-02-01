class ReviewsController < ApplicationController
  # require authentication w/ devise

  def index
    @reviews = current_user.reviews
  end

  def new
    @review = Review.new
  end

  def create
    binding.pry
    @review = current_user.reviews.build(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_path, notice: "Review was successfully created." }
        format.json
      else
        format.html 
        format.json 
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
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

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :content, :rating)
  end
  
end
