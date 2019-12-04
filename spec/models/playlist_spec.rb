require "rails_helper"

RSpec.describe Playlist, type: :model do
  describe "relationships" do
    it { should have_many :playlist_songs}
    it { should have_many(:songs).through(:playlist_songs)}
  end
end
