class BandsController < ApplicationController

  before_action :require_login

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(bands_params)
    if @band.save!
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
  end

  def edit
    @band = Band.find(params[:id])
  end

  def show
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(bands_params)
      redirect_to bands_url
    else 
      flash.now[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      redirect_to bands_url
    else 
      flash.now[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  def bands_params
    params.require(:band).permit(:name)
  end
end
