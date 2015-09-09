class ReviewsController < ApplicationController

  respond_to :html, :js

  def index
    @reviews = Review.includes(:movie).order('created_at DESC').all
    @movies = Movie.all

    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end


  def create
    @review = Review.new(params_list)
    if @review.save
      flash[:success] = "new review added"

      # respond_to do |format|
      #   format.html
      #   format.js
      # end
      render :index

    else
      flash.now[:error]= "didn't create review"
      render :index
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = "Your review has been deleted!"
      redirect_to reviews_path
    else
      flash[:error] = "There was an error deleting the review"
      redirect_to reviews_path
    end
  end

  private

  def params_list
    params.require(:review).permit(:reviewer_name, :title, :review_date, :review_text, :movie_id, :id)
  end

end
