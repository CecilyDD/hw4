class PlacesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_user, only: [:new, :edit, :create, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries.where(user_id: current_user.id)

  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path, notice: "Place was successfully created."
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end
end
