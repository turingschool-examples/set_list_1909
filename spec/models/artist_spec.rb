require 'rails_helper'

describe Artist, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :songs}
  end
  describe 'methods' do
    it "an artist can calculate average length of songs" do
      carly_rae = Artist.create(name: "Carly Rae")
      song_1 = carly_rae.songs.create(title: "I Really Like You",
                           length:      200,
                           play_count:  243810867)
      song_2 = Song.create(title:       "Call Me Maybe",
                           length:      300,
                           play_count:  1214722172,
                          artist_id: carly_rae.id)
      song_3 = Song.create(title:       "Song 3",
                           length:      700,
                           play_count:  121472,
                          artist_id: carly_rae.id)
      expect(carly_rae.average_length_of_songs).to eq(400)
    end
  end
end
