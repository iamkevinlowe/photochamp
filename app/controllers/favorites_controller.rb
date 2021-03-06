class FavoritesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @favorite = current_user.favorites.build(photo_id: @photo.id)
    
    authorize @favorite
    if @favorite.save
      flash[:notice] = "\"#{@photo.name}\" has been favorited."
    else
      flash[:error] = "Something went wrong. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @favorite = Favorite.find(params[:id])
    
    authorize @favorite
    if @favorite.destroy
      flash[:notice] = "\"#{@photo.name}\" has been unfavorited."
    else
      flash[:error] = "Something went wrong. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end