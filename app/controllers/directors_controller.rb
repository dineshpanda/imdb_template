class DirectorsController < ApplicationController
  before_action :set_director, only: %i[show edit update destroy]

  def index
    @directors = Director.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@directors.where.not(address_latitude: nil)) do |director, marker|
      marker.lat director.address_latitude
      marker.lng director.address_longitude
    end
  end

  def show
    @movie = Movie.new
  end

  def new
    @director = Director.new
  end

  def edit; end

  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to @director, notice: "Director was successfully created."
    else
      render :new
    end
  end

  def update
    if @director.update(director_params)
      redirect_to @director, notice: "Director was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @director.destroy
    redirect_to directors_url, notice: "Director was successfully destroyed."
  end

  private

  def set_director
    @director = Director.find(params[:id])
  end

  def director_params
    params.require(:director).permit(:name, :dob, :bio, :image, :address)
  end
end
