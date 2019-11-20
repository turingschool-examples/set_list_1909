class Song < ApplicationRecord
  validates_presence_of :title, :length, :play_count
  belongs_to :artist

  def self.count_of_songs
    count
  end


end
