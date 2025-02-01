class PhotosController < ApplicationController
  
  def index
    @photos = Photo.all
    render :index
  end

  def show
    id_find = params[:id]
    @photo = Photo.find_by(id: id_find)
    render :show
  end

  def create
    @photo = Photo.new(
      name:   params[:name],
      width:  params[:width],
      height: params[:height]
    )
    @photo.save
    render :show
  end

  def update
    @photo = Photo.find_by(id: params[:id])
    @photo.name   =  params[:name]
    @photo.width  =  params[:width]
    @photo.height =  params[:height]
    render :show
  end

  def delete
    photo = Photo.find_by(id: params[:id])
    photo.destroy
    render json: { message: "You have destroyed this image!" }
  end
end
