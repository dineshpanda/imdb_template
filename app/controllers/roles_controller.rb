class RolesController < ApplicationController
  before_action :set_role, only: %i[show edit update destroy]

  def index
    @q = Role.ransack(params[:q])
    @roles = @q.result(distinct: true).includes(:movie, :lead_movie, :actor).page(params[:page]).per(10)
  end

  def show; end

  def new
    @role = Role.new
  end

  def edit; end

  def create
    @role = Role.new(role_params)

    if @role.save
      message = "Role was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @role, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @role.update(role_params)
      redirect_to @role, notice: "Role was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @role.destroy
    message = "Role was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to roles_url, notice: message
    end
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:movie_id, :actor_id, :character_name, :description, :lead)
  end
end
