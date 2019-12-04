require 'rails_helper'

RSpec.describe 'Artist Index Page' do
  it "I can see all artist names and buttons to edit and delete each of them" do
    beatles = Artist.create(name: 'Beatles')
    queen = Artist.create(name: 'Queen')
    artists_array = [beatles, queen]
    visit '/artists'

    artists_array.each do |artist|
      within "#artist-#{artist.id}" do
        expect(page).to have_content(artist.name)
        expect(page).to have_link("Edit")
        expect(page).to have_button("Delete")
      end
    end

  end
end
