class MoviesController < ApplicationController

  def index
    @movie = Movie.new
    @movies = Movie.all

    respond_to do |format|
      format.html {render 'movies/json_text.html'}
      format.json {render :json => @movies }
    end
  end

  # def new
  # end

  def create
    @movie = Movie.new(params_list)
    if @movie.save
      respond_to do |format|
        format.html {render 'movies/json_text.html'}
        format.json {render :json => @movie}
      end
    else
      respond_to do |format|
        format.html {render 'movies/json_text.html'}
        format.json {}
      end
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
