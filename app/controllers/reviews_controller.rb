class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  
  def index
    @reviews = Review.order(created_at: :desc) 
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to root_path
  end

  def movie_reviews
    @reviews = Review.where(movie_id: params[:movie_id]).order(created_at: :desc)
  end

  private
     def review_params
      params.require(:review).permit(:user_id, :movie_id, :comment, :user_email, :rating)
    end
end
