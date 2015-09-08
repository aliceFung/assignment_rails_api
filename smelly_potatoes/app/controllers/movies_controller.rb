class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params_list)
    if @movie.save
      flash[:success] = "new movie added"
      redirect_to @movie
    else
      flash.now[:error]= "didn't create movie"
      render :new
    end
  end

  def show
    @movie = Movie.find(:id)
  end

  private

  def params_list
    params.require(:movie).permit(:name, :release_date, :id)
  end

end
