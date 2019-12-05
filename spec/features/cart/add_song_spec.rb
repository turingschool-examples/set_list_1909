require 'rails_helper'

RSpec.describe "When a user adds songs to their cart" do
  it "displays a message" do
    artist = Artist.create(name: "Rick Astley")
    song = artist.songs.create(title: "Never gonna give you up",
                               length: 250,
                               play_count: 123234)
    song_2 = artist.songs.create(title: "Together forever",
                                 length: 180,
                                 play_count: 2)

    visit '/songs'

    expect(page).to have_content("Cart: 0")

    within("#song-#{song.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("Cart: 1")

    within("#song-#{song_2.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("Cart: 2")

    within("#song-#{song.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("Cart: 3")
    expect(page).to have_content("You now have 2 copies of #{song.title} in your cart.")
  end
end
