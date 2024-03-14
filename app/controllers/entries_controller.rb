class EntriesController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.new(entry_params)
    if @entry.save
      redirect_to place_path(@place), notice: "Entry was successfully created."
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on)
  end
end
