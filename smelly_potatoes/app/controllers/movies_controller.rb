class MoviesController < ApplicationController

  def index
    render :json_test
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params_list)
    respond_to do |format|
      if @movie.save
        format.html {redirect_to @movie, notice: "new movie added"}
        format.json {render :show}
      else
        format.html {render :new, notice: "didn't create movie"}
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
      end
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
