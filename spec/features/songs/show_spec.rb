require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a song show page' do
    it 'only see that songs title and artist' do
      talking_heads = Artist.create!(name: 'Talking Heads')
      she_was = talking_heads.songs.create(title: 'And She Was', length: 234, play_count: 1)
      wild_life = talking_heads.songs.create(title: 'Wild Wild Life', length: 456, play_count: 2)

      visit "/songs/#{she_was.id}"

      expect(page).to have_content(she_was.title)
      expect(page).to have_content("By: #{talking_heads.name}")

      expect(page).to_not have_content(wild_life.title)
    end
  end
end
