class AlbumsController < ApplicationController


  before_action :require_login


  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:band_id]
    if @album.save!
      redirect_to band_albums_url(@album.band_id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:item][:band_id])
  end

  def index
    @band = Band.find(params[:band_id])
    @albums = @band.albums
  end

  def update
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_albums_url(@album.band_id)
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :in_studio, :band_id)
  end

end
