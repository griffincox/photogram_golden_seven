class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo_id = params[:id]
    @photo = Photo.find(@photo_id)
    @source = @photo.source
    @caption = @photo.caption
    render("show.html.erb")
  end


end
