require 'rails_helper'

RSpec.describe 'Edit Artist' do
  describe 'as a visitor' do

    it 'can update an artist' do
      beatles = Artist.create(name: 'Beatles')
      queen = Artist.create(name: 'Queen')

      visit '/artists'

      within "#artist-#{beatles.id}" do
        click_link 'Edit'
      end

      expect(current_path).to eq("/artists/#{beatles.id}/edit")

      fill_in 'Name', with: 'Beach Boys'
      click_on 'Update Artist'

      expect(current_path).to eq("/artists")
      expect(page).to have_content('Beach Boys')
      expect(page).to_not have_content('Beatles')
    end
  end
end
