class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html {render 'movies/json_text.html'}
      format.json {render :json => @movies }
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params_list)


    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def params_list
    params.require(:movie).permit(:name, :release_date, :id)
  end

end
