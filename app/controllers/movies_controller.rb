class MoviesController < ApplicationController
  before_action :current_director_must_be_movie_director, only: %i[edit update destroy]

  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true).includes(:roles, :lead_roles, :director, :cast).page(params[:page]).per(10)
  end

  def show
    @role = Role.new
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      message = "Movie was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @movie, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    message = "Movie was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to movies_url, notice: message
    end
  end

  private

  def current_director_must_be_movie_director
    set_movie
    unless current_director == @movie.director
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :duration, :description, :director_id)
  end
end
