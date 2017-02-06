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

  def delete_photo
    @photo_id = params[:id]
    @photo = Photo.find(@photo_id)
    @photo.destroy
    @list_of_photos = Photo.all
    redirect_to("http://localhost:3000/photos")
  end

  def new_form
    render("new_form.html.erb")
  end

  def create_row
    @photo_url = params[:the_source]
    @photo_caption = params[:the_caption]
    @new_photo = Photo.new
    @new_photo.source = @photo_url
    @new_photo.caption = @photo_caption
    if (@new_photo.save)
      @list_of_photos = Photo.all
      redirect_to("http://localhost:3000/photos")
    else
      render("new_form.html.erb")
    end

  end

  def edit_form
    @photo_id = params[:id]
    @photo = Photo.find(@photo_id)
    @photo_url = @photo.source
    @photo_caption = @photo.caption
    render("edit_form.html.erb")
  end

  def update_row
    @photo_id = params[:id]
    @photo_url = params[:the_source]
    @photo_caption = params[:the_caption]
    @update_photo = Photo.find(@photo_id)
    @update_photo.source = @photo_url
    @update_photo.caption = @photo_caption
    if (@update_photo.save)
      @list_of_photos = Photo.all
      redirect_to("http://localhost:3000/photos/#{@photo_id}")
    else
      render("edit_form.html.erb")
    end
  end

end
