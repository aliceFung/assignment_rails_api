class ReviewsController < ApplicationController

  def index
    @movies = Movie.all

    respond_to |format|
      format.html 
      format.json
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_list)
    if @review.save
      flash[:success] = "new review added"
      redirect_to @review
    else
      flash.now[:error]= "didn't create review"
      render :new
    end
  end

  def show
    @review = review.find(:id)
  end

  private

  def params_list
    params.require(:review).permit(:reviewer_name, :title, :review_date, :review_text, :movie_id, :id)
  end

end
