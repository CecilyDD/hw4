class EntriesController < ApplicationController
  before_action :require_login
  before_action :set_place, only: [:create, :index]

  def create
    @entry = @place.entries.new(entry_params)

    if @entry.save
      redirect_to place_entries_path(@place), notice: "Entry was successfully created."
    else
      flash.now[:alert] = "Failed to create entry."
      render :new
    end
  end

  def new
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build
  end

  def index
    @entries = @place.entries
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :uploaded_file).merge(user_id: current_user.id)
  end

  def set_place
    @place = Place.find(params[:place_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Place not found."
    redirect_to root_path
  end

  def require_login
    redirect_to login_path, notice: "Please log in first." unless current_user
  end
end
