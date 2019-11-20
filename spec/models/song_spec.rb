require 'rails_helper'

describe Song, type: :model do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :length}
    it {should validate_presence_of :play_count}
  end
  describe "relationships" do
    it {should belong_to :artist}
  end
  describe "methods" do
    it "can count all songs in the database" do
      carly_rae = Artist.create(name: "Carly Rae")
      song_1 = carly_rae.songs.create(title: "I Really Like You",
                           length:      208,
                           play_count:  243810867)
      song_2 = Song.create(title:       "Call Me Maybe",
                           length:      199,
                           play_count:  1214722172,
                          artist_id: carly_rae.id)
      song_3 = Song.create(title:       "Song 3",
                           length:      199,
                           play_count:  121472,
                          artist_id: carly_rae.id)
      lengths_of_199 = Song.where(length: 199)
      lengths_of_199.count_of_songs
      # songs = Song.all
      expect(lengths_of_199.count_of_songs).to eq(2)
    end
  end
end
