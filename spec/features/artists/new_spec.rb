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

        expect(current_path).to eq('/artists')
        expect(page).to have_content('Meg')
      end
    end
  end
end
