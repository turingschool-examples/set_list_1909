class CartController < ApplicationController
  include ActionView::Helpers::TextHelper
  def update
    song = Song.find(params[:song_id])
    cart.add_song(song.id)
    session[:cart] = cart.contents
    quantity = cart.count_of(song.id)
    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{song.title} in your cart."
    redirect_to '/songs'
  end
end
