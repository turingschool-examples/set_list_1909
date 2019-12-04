require 'rails_helper'

RSpec.describe "the Playlist index page" do
  it "should display all playlists" do
    rock = Playlist.create!(name: "Classic Rock")
    country = Playlist.create!(name: "Country")
    jams = Playlist.create!(name: "Favorite Jams")

    talking_heads = Artist.create!(name: "Talking Heads")
    journey = Artist.create!(name: "Journey")
    zac_brown = Artist.create!(name: "Zac Brown Band")

    place = rock.songs.create!(title: "This Must Be The Place", length: 832, play_count: 83209, artist: talking_heads)
    heaven = rock.songs.create!(title: "Heaven", length: 832, play_count: 83209, artist: talking_heads)
    dont_stop = rock.songs.create!(title: "Don't Stop Believin'", length: 832, play_count: 83209, artist: journey)

    chicken = zac_brown.songs.create!(title: "Chicken Fried", length: 4378, play_count: 7453689)
    country.songs << chicken
    jams.songs << chicken
    jams.songs.push(place)


    visit '/playlists'

    within("#playlist-#{rock.id}") do
      expect(page).to have_content(rock.name)

      within("#song-#{place.id}") do
        expect(page).to have_content(place.title)
      end
      within("#song-#{heaven.id}") do
        expect(page).to have_content(heaven.title)
      end
      within("#song-#{dont_stop.id}") do
        expect(page).to have_content(dont_stop.title)
      end
    end

    within("#playlist-#{country.id}") do
      expect(page).to have_content(country.name)

      within("#song-#{chicken.id}") do
        expect(page).to have_content(chicken.title)
      end
    end

    within("#playlist-#{jams.id}") do
      expect(page).to have_content(jams.name)

      within("#song-#{chicken.id}") do
        expect(page).to have_content(chicken.title)
      end
      within("#song-#{place.id}") do
        expect(page).to have_content(place.title)
      end
    end
  end
end
