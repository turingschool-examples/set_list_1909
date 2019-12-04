class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    artist = Artist.new(artist_params)

    if artist.save
      flash[:success] = 'YOU DID THE THING'
      redirect_to '/artists'
    else
      flash[:notice] = 'Artist not created: Required information missing.'
      render :new
    end

  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to '/artists'
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to '/artists'
  end

  private

  def artist_params
    params.permit(:name)
  end






end
