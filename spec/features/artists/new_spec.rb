require 'rails_helper'

RSpec.describe 'New artist' do
  describe 'As a visitor' do
    describe 'when i visit the new artist form by clicking a link on the index' do

      it 'creates a new artist' do
        visit '/artists'

        click_link 'New Artist'

        expect(current_path).to eq('/artists/new')

        fill_in 'Name', with: 'Meg'
        click_on 'Create Artist'

        new_artist = Artist.last

        expect(current_path).to eq('/artists')
        expect(new_artist.name).to eq("Meg")
        expect(page).to have_css("#artist-#{new_artist.id}")
      end

      it 'cannot create an artist without a name' do
        visit '/artists/new'

        click_on 'Create Artist'

        expect(page).to have_content('Artist not created: Required information missing.')
        expect(page).to have_button('Create Artist')
      end
    end
  end
end
