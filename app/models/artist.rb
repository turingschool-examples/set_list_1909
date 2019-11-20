class Artist <ApplicationRecord
  validates_presence_of :name
  has_many :songs

  def average_length_of_songs
    songs.average(:length)
  end
end
