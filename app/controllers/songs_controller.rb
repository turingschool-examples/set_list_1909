class SongsController < ApplicationController
  def index
    @songs = Song.all
    cart = Cart.new(session[:cart])
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @artist_id = params[:artist_id]
  end

  def create
    artist = Artist.find(params[:artist_id])
    song = artist.songs.create!(song_params)

    redirect_to "/songs/#{song.id}"
  end

  private
    def song_params
      params.permit(:title, :play_count, :length)
    end

end
